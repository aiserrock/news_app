import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/repositories/repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Repository repository;

  HomeBloc(this.repository) : super(HomeInitial());

  List<Article> articles = [];

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeInitialLoadEvent) {
      yield* loadArticles();
    }
    if (event is HomeMoreLoadEvent) {
      yield* loadArticles();
    }
  }

  Stream<HomeState> loadArticles() async* {
    yield HomeDataState(isLoading: true, articles: articles);

    final response = await repository.getTopHeadlinesNews();

    if (response.hasData) {
      articles = response.data!.articles;
      yield HomeDataState(articles: articles);
    } else {
      yield HomeDataState(articles: articles,error: response.errorCode);
    }
  }
}
