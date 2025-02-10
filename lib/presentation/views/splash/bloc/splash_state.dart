import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {
  final bool sessionValid;
  SplashLoaded({required this.sessionValid});
}

class SplashError extends SplashState {
  final String message;
  SplashError({required this.message});
}
