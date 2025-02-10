import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty/core/router/router.dart';
import 'package:rick_and_morty/core/storage/int_list_adapter.dart';
import 'package:rick_and_morty/injection.dart';
import 'package:rick_and_morty/presentation/views/details/bloc/detail_cubit.dart';
import 'presentation/views/home/blocs/home_cubit.dart';
import 'presentation/views/login/bloc/login_cubit.dart';
import 'presentation/views/splash/bloc/splash_cubit.dart';

final sl = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(IntListAdapter());
  await setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<DetailCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<SplashCubit>(),
        ),
        BlocProvider(
          create: (_) => sl<LoginCubit>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Rick and Morty App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: GetIt.I<MicroAppRouter>().config(),
    );
  }
}
