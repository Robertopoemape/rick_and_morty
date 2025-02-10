import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../src/domain/entities/entities.dart';
import '../bloc/blocs.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    required this.cubit,
    required this.character,
    super.key,
  });

  final DetailCubit cubit;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ds16, vertical: ds12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("Género", Formatters.formatGender(character.gender)),
          _buildSeparator(),
          _buildDetailRow("Especie", character.species),
          _buildSeparator(),
          _buildDetailRow("origen", character.origin.name),
          _buildSeparator(),
          _buildDetailRow("ultima ubicación", character.location.name),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: ints3,
          child: Text(
            "$label:",
            style: const TextStyle(
              fontSize: ds16,
              fontWeight: FontWeight.bold,
              color: grey200,
            ),
          ),
        ),
        Expanded(
          flex: ints7,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: ds18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: ds8),
      child: Divider(
        thickness: ds05,
        color: Colors.grey[300],
      ),
    );
  }
}
