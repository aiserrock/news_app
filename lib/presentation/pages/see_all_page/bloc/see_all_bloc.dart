import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/repositories/repository.dart';

part 'see_all_event.dart';

part 'see_all_state.dart';

class SeeAllBloc extends Bloc<SeeAllEvent, SeeAllState> {
  final Repository repository;
  SeeAllBloc(this.repository) : super(SeeAllInitial());

  List<Article> articles = [];

  @override
  Stream<SeeAllState> mapEventToState(
    SeeAllEvent event,
  ) async* {
    if (event is SeeAllInitialLoadEvent) {
      yield* loadArticle();
    }
    if (event is SeeAllMoreLoadEvent) {
      yield* loadArticle();
    }
  }

  Stream<SeeAllState> loadArticle() async* {
    yield SeeAllDataState(isLoading: true, articles: articles);

    final response = await repository.getTopHeadlinesNews();

    if (response.hasData) {
      articles = response.data!.articles;
      yield SeeAllDataState(articles: articles);
    } else {
      yield SeeAllDataState(articles: articles,error: response.errorCode);
    }
  }
}
