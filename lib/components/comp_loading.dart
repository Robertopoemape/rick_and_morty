import 'package:flutter/material.dart';

class CompLoading extends StatelessWidget {
  const CompLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
