import 'package:equatable/equatable.dart';

import '../../../../src/domain/entities/entities.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  final List<Character> characters;
  HomeLoading(this.characters);
}

class HomeLoaded extends HomeState {
  final List<Character> characters;
  HomeLoaded(this.characters);

  @override
  List<Object?> get props => [characters];
}

class HomeSearchState extends HomeState {
  final List<Character> characters;
  final bool isSearching;
  HomeSearchState(this.characters, this.isSearching);
  @override
  List<Object?> get props => [characters, isSearching];
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
