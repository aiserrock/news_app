import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/repositories/repository.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.repository) : super(SearchInitial());

  final Repository repository;
  List<Article> articles = [];

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchInitialLoadEvent) {
      yield* loadArticles();
    }
    if (event is SearchMoreLoadEvent) {
      yield* loadArticles();
    }
    if (event is ChooseChipEvent) {
      yield* loadArticles();
    }
  }

  Stream<SearchState> loadArticles() async* {
    yield SearchDataState(isLoading: true, articles: articles);

    final response = await repository.getEverythingNews();

    if (response.hasData) {
      articles = response.data!.articles;
      var totalResults = response.data!.totalResults;
      yield SearchDataState(articles: articles, totalResults: totalResults);
    } else {
      yield SearchDataState(articles: articles, error: response.errorCode);
    }
  }
}
