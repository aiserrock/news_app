part of 'every_news_bloc.dart';

abstract class EveryNewsEvent extends Equatable {
  const EveryNewsEvent();
}

class EveryNewsInitialLoadEvent extends EveryNewsEvent {
  @override
  List<Object?> get props => [];
}

class EveryNewsMoreLoadEvent extends EveryNewsEvent {
  @override
  List<Object?> get props => [];
}

class ChooseChipEvent extends EveryNewsEvent {
  final String text;

  ChooseChipEvent(this.text);

  @override
  List<Object?> get props => [text];
}
