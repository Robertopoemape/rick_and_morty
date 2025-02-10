import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/components/components.dart';
import '../../../../core/core.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(ds16),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              autoRouterPush(context, HomeRoute());
            } else if (state is LoginError) {
              compShowDialogMessage(
                context,
                message: state.message,
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/img/logo.jpeg',
                      width: ds250,
                      height: ds250,
                    ),
                  ),
                  gap40,
                  TextField(
                    controller: loginCubit.controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  gap16,
                  TextField(
                    controller: loginCubit.controllerPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  gap32,
                  ElevatedButton(
                    onPressed: () {
                      if (loginCubit.controllerEmail.text.isNotEmpty &&
                          loginCubit.controllerPassword.text.isNotEmpty) {
                        final cubit = context.read<LoginCubit>();
                        cubit.login(
                          loginCubit.controllerEmail.text,
                          loginCubit.controllerPassword.text,
                        );
                      } else {
                        compShowDialogMessage(context,
                            message: 'Por favor llene los campos');
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
