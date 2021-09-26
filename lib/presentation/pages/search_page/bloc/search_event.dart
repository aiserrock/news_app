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
  final String text;

  ChooseChipEvent(this.text);

  @override
  List<Object?> get props => [text];
}
