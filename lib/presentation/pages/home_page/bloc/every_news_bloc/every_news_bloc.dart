import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/constants.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/repositories/repository.dart';

part 'every_news_event.dart';

part 'every_news_state.dart';

class EveryNewsBloc extends Bloc<EveryNewsEvent, EveryNewsState> {
  final Repository repository;
  List<Article> articles = [];

  EveryNewsBloc(this.repository) : super(EveryNewsInitial());


  @override
  Stream<EveryNewsState> mapEventToState(EveryNewsEvent event) async* {
    if (event is EveryNewsInitialLoadEvent) {
      yield* loadArticlesWithSearchQuery(query: Constants.SEARCH_THEME.first);
    }
    // if (event is SearchMoreLoadEvent) {
    //   yield* loadArticles();
    // }
    if (event is ChooseChipEvent) {
      yield* loadArticlesWithSearchQuery(query: event.text);
    }
  }

  Stream<EveryNewsState> loadArticlesWithSearchQuery(
      {required String query}) async* {
    yield EveryNewsDataState(isLoading: true, articles: articles,chipText: query);

    final response = await repository.getEverythingNews(qInTitle: query);

    if (response.hasData) {
      articles = response.data!.articles;
      var totalResults = response.data!.totalResults;
      yield EveryNewsDataState(
          articles: articles, totalResults: totalResults, chipText: query);
    } else {
      yield EveryNewsDataState(articles: articles, error: response.errorCode);
    }
  }
}

