import 'package:flutter/material.dart';
import 'package:roller_dice/gradient_container.dart';

class RollediceApp extends StatelessWidget {
  const RollediceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(),
      ),
    );
  }
}
