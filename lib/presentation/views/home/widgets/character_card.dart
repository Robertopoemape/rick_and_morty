import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../src/domain/entities/entities.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      margin: EdgeInsets.symmetric(horizontal: ds16, vertical: ds8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(ds12),
        leading: ClipOval(
          child: CachedNetworkImage(
            width: ds53,
            height: ds53,
            imageUrl: character.image,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(character.name),
            buildText(character.species),
            if (character.type.isNotEmpty) buildText(character.type),
          ],
        ),
        onTap: () {
          autoRouterPush(context, DetailRoute(character: character));
        },
      ),
    );
  }

  Widget buildText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: grey200,
      ),
    );
  }
}
