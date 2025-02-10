import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../components/components.dart';
import '../../../../core/core.dart';

import '../blocs/blocs.dart';
import '../../login/bloc/login_cubit.dart';
import '../widgets/card_list.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const TextStyle _appBarTitleStyle = TextStyle(
    fontSize: ds28,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final characterCubit = context.watch<HomeCubit>();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                  characterCubit.isSearching ? Icons.close : Icons.search,
                  color: Colors.white),
              onPressed: characterCubit.toggleSearch,
            ),
            IconButton(
              icon: const Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: () {
                compShowDialogMessage(
                  context,
                  isReturn: true,
                  title: 'Cerrar Sesión',
                  message: '¿Estas seguro que desea cerrar sesión?',
                  label: 'Si',
                  onPressed: () {
                    context.read<LoginCubit>().logout();
                    context.router.replace(const LoginRoute());
                  },
                );
              },
            ),
          ],
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: bgColor,
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: ints300),
            child: characterCubit.isSearching
                ? _buildSearchBar(context)
                : Text('Rick and Morty', style: _appBarTitleStyle),
          ),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return _buildStateContent(state, context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return _buildFloatingButton(state, context);
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Buscar personaje...',
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: const Icon(Icons.search, color: Colors.white),
        border: InputBorder.none,
      ),
      style: const TextStyle(color: Colors.white),
      onChanged: (query) {
        context.read<HomeCubit>().searchCharacters(query);
      },
    );
  }

  Widget _buildStateContent(HomeState state, BuildContext context) {
    if (state is HomeLoading) {
      return const CompLoading();
    } else if (state is HomeLoaded) {
      return CardList(characters: state.characters);
    } else if (state is HomeError) {
      return CompError(
        message: state.message,
        onRetry: () {
          context.read<HomeCubit>().getCharacters();
        },
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildFloatingButton(HomeState state, BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.amberAccent,
      splashColor: bgColor,
      onPressed: () {
        context.read<HomeCubit>().getCharacters();
      },
      child: const Icon(Icons.sync),
    );
  }
}
