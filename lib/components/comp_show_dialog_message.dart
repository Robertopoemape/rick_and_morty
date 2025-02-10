import 'package:flutter/material.dart';

import '../core/router/router.dart';

void compShowDialogMessage(BuildContext context,
    {String title = 'Error',
    String message = 'Error',
    String labelReturn = 'Regresar',
    String label = 'Ok',
    bool isReturn = false,
    VoidCallback? onPressed}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(message),
      actions: [
        if (isReturn)
          TextButton(
            onPressed: () => autoRouterPop(context),
            child: Text(labelReturn),
          ),
        ElevatedButton(
          onPressed: onPressed ?? () => autoRouterPop(context),
          child: Text(label),
        ),
      ],
    ),
  );
}
