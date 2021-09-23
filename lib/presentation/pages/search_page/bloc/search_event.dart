part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchInitialLoadEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class SearchMoreLoadEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class ChooseChipEvent extends SearchEvent {
  @override
  List<Object?> get props => [];
}