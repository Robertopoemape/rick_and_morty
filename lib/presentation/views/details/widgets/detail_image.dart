import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../src/src.dart';
import '../bloc/blocs.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({
    required this.context,
    required this.characterCubit,
    required this.character,
    super.key,
  });

  final BuildContext context;
  final DetailCubit characterCubit;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: CachedNetworkImage(
            imageUrl: character.image,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * ds05,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: ds10,
          left: ds5,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: ds4,
              horizontal: ds8,
            ),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(ds08),
                borderRadius: BorderRadius.all(Radius.circular(ds8))),
            child: Row(
              children: [
                Text(
                  Formatters.formatStatus(character.status),
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: ds10,
          right: ds5,
          child: BlocBuilder<DetailCubit, DetailState>(
            builder: (context, state) {
              final isFavorite =
                  context.read<DetailCubit>().isFavorite(character.id);

              return CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    context.read<DetailCubit>().toggleFavorite(character);
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
