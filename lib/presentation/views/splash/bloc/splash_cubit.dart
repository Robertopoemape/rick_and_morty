import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/presentation/views/splash/bloc/splash_state.dart';
import 'package:rick_and_morty/core/storage/local_storage.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  final LocalStorage localStorage = GetIt.instance<LocalStorage>();

  Future<void> validateSession() async {
    try {
      emit(SplashLoading());

      final sessionValid = await localStorage.isSessionValid();

      if (sessionValid) {
        emit(SplashLoaded(sessionValid: true));
      } else {
        emit(SplashLoaded(sessionValid: false));
      }
    } catch (e) {
      emit(SplashError(message: e.toString()));
    }
  }
}
