part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchDataState extends SearchState {
  final bool isLoading;
  final String? error;
  final List<Article> articles;
  final int totalResults;

  SearchDataState({
    this.isLoading = false,
    this.error,
    this.articles = const [],
    this.totalResults = 0,
  });

  @override
  List<Object?> get props => [isLoading, error, articles,totalResults];
}

class ChipDataState extends SearchState {
  final String chipText;

  ChipDataState(this.chipText);

  @override
  List<Object?> get props => [chipText];
}
