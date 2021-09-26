import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/constants.dart';
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
      yield* loadArticlesWithSearchQuery(query: Constants.SEARCH_THEME.first);
    }
    // if (event is SearchMoreLoadEvent) {
    //   yield* loadArticles();
    // }
    if (event is ChooseChipEvent) {
      yield* loadArticlesWithSearchQuery(query: event.text);
    }
  }

  Stream<SearchState> loadArticlesWithSearchQuery({required String query}) async* {
    if(query == 'Filter'){
      yield SearchDataState(articles: articles,chipText: query);
      return;
    }
    yield SearchDataState(isLoading: true, articles: articles,chipText: query);
    final response = await repository.getEverythingNews(qInTitle: query);

    if (response.hasData) {
      articles = response.data!.articles;
      var totalResults = response.data!.totalResults;
      yield SearchDataState(articles: articles, totalResults: totalResults,chipText: query);
    } else {
      yield SearchDataState(articles: articles, error: response.errorCode);
    }
  }
}
