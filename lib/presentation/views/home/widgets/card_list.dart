import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../src/domain/entities/entities.dart';
import '../blocs/blocs.dart';
import 'character_card.dart';

class CardList extends StatelessWidget {
  const CardList({
    required this.characters,
    super.key,
  });
  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return ListView.builder(
      controller: homeCubit.scrollController,
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return CharacterCard(
          character: characters[index],
        );
      },
    );
  }
}
