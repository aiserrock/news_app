part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeDataState extends HomeState {
  final bool isLoading;
  final String? error;
  final List<Article> articles;

  HomeDataState({
    this.isLoading = false,
    this.error,
    this.articles = const [],
  });

  @override
  List<Object?> get props => [isLoading, error, articles];
}
