part of 'see_all_bloc.dart';

abstract class SeeAllEvent extends Equatable {
  const SeeAllEvent();
}

class SeeAllInitialLoadEvent extends SeeAllEvent {
  @override
  List<Object?> get props => [];
}

class SeeAllMoreLoadEvent extends SeeAllEvent {
  @override
  List<Object?> get props => [];
}
