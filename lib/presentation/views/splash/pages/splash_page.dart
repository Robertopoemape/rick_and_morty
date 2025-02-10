import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/components/components.dart';

import '../../../../core/core.dart';
import '../bloc/splash_cubit.dart';
import '../bloc/splash_state.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: ints1),
    );

    _fadeAnimation =
        Tween<double>(begin: ds0, end: ds1).animate(_animationController);

    _animationController.forward();

    Future.delayed(Duration.zero, () {
      final cubit = context.read<SplashCubit>();
      cubit.validateSession();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoaded) {
            Future.delayed(const Duration(seconds: ints1), () {
              if (state.sessionValid) {
                autoRouterPush(context, HomeRoute());
              } else {
                autoRouterPush(context, LoginRoute());
              }
            });
          } else if (state is SplashError) {
            compShowDialogMessage(
              context,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          // Mientras cargamos la sesión, mostramos el cargador
          if (state is SplashLoading) {
            return CompLoading();
          }

          return FadeTransition(
            opacity: _fadeAnimation,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/img/logo.jpeg',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  gap20,
                  const Text(
                    "Rick and Morty",
                    style: TextStyle(
                      fontSize: ds28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
