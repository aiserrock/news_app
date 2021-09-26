part of 'every_news_bloc.dart';

abstract class EveryNewsState extends Equatable {
  const EveryNewsState();
}

class EveryNewsInitial extends EveryNewsState {
  @override
  List<Object> get props => [];
}

class EveryNewsDataState extends EveryNewsState {
  final bool isLoading;
  final String? error;
  final List<Article> articles;
  final int totalResults;
  final String chipText;

  EveryNewsDataState({
    this.isLoading = false,
    this.error,
    this.articles = const [],
    this.totalResults = 0,
    this.chipText = 'loading...',
  });

  @override
  List<Object?> get props => [isLoading, error, articles,totalResults,chipText];
}