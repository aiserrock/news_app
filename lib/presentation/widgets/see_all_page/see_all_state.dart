part of 'see_all_bloc.dart';


abstract class SeeAllState extends Equatable {
  const SeeAllState();
}

class SeeAllInitial extends SeeAllState {
  @override
  List<Object> get props => [];
}

class SeeAllDataState extends SeeAllState {
  final bool isLoading;
  final String? error;
  final List<Article> articles;

  SeeAllDataState({
    this.isLoading = false,
    this.error,
    this.articles = const [],
  });

  @override
  List<Object?> get props => [isLoading, error, articles];
}
