import 'package:flutter/material.dart';
import 'package:roller_dice/gradient_container.dart';
import 'package:roller_dice/roller_dicer.dart';

class RollediceApp extends StatelessWidget {
  const RollediceApp({super.key});

  @override
  Widget build(BuildContext context) {
    RollerDice rollerDice = const RollerDice();
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(),
      ),
    );
  }
}
