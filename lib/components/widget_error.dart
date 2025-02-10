import 'package:flutter/material.dart';

import '../core/core.dart';

class CompError extends StatelessWidget {
  const CompError({
    this.onRetry,
    required this.message,
    super.key,
  });

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: ds16)),
          gap16,
          ElevatedButton(
            onPressed: onRetry,
            child: Text('Reintentar'),
          ),
        ],
      ),
    );
  }
}
