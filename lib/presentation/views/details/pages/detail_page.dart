import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';

import '../../../../src/src.dart';
import '../bloc/blocs.dart';
import '../widgets/widgets.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    final characterCubit = context.read<DetailCubit>();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: bgColor,
          centerTitle: true,
          title: Text(
            character.name,
            style: TextStyle(
              fontSize: ds28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailImage(
              context: context,
              characterCubit: characterCubit,
              character: character,
            ),
            DetailBody(
              cubit: characterCubit,
              character: character,
            ),
          ],
        ),
      ),
    );
  }
}
