import 'package:flutter/material.dart';
import 'package:roller_dice/roller_dicer.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.blue, Colors.redAccent],
        begin: beginAlignment,
        end: endAlignment,
      )),
      child: const Center(child: RollerDice()),
    );
  }
}
