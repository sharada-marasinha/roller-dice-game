import 'package:flutter/material.dart';
import 'package:roller_dice/new_game.dart';
import 'package:roller_dice/roller_dicer.dart';
import 'package:roller_dice/score.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 255, 255, 255),
          Color.fromARGB(255, 0, 0, 0)
        ],
        begin: beginAlignment,
        end: endAlignment,
      )),
      child: Center(child: const ScoreDisplay()),
    );
  }
}
