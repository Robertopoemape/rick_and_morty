import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/router/router.dart';
import 'package:rick_and_morty/presentation/views/splash/bloc/splash_cubit.dart';

import 'core/network/api_service.dart';
import 'core/storage/local_storage.dart';
import 'presentation/views/details/bloc/blocs.dart';
import 'presentation/views/home/blocs/blocs.dart';
import 'presentation/views/login/bloc/login_cubit.dart';
import 'src/src.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<ApiService>(() => ApiService());

  sl.registerLazySingleton<MicroAppRouter>(() => MicroAppRouter());

  sl.registerLazySingleton<LocalStorage>(() => LocalStorage());

  sl.registerLazySingleton<CharacterRepository>(
      () => CharacterRepositoryImpl(sl()));

  sl.registerLazySingleton<GetCharactersUseCase>(
      () => GetCharactersUseCase(sl()));
  sl.registerLazySingleton<SearchCharactersUseCase>(
      () => SearchCharactersUseCase(sl()));
  sl.registerLazySingleton<ToggleFavoriteUseCase>(
      () => ToggleFavoriteUseCase(sl()));

  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  sl.registerFactory<SplashCubit>(() => SplashCubit(
        sl(),
      ));
  sl.registerFactory<HomeCubit>(() => HomeCubit());
  sl.registerFactory<DetailCubit>(() => DetailCubit());
}
