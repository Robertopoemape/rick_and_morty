import 'package:equatable/equatable.dart';

import '../../../../src/domain/entities/entities.dart';

class DetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DetailInitial extends DetailState {}

class DetailsLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final List<Character> characters;
  final List<int> favorites;
  DetailLoaded(this.characters, this.favorites);

  @override
  List<Object?> get props => [characters, favorites];
}

class DetailError extends DetailState {
  final String message;
  DetailError(this.message);

  @override
  List<Object?> get props => [message];
}
