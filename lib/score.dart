import 'dart:math';

import 'package:flutter/material.dart';

class ScoreDisplay extends StatefulWidget {
  const ScoreDisplay({super.key});

  @override
  State<ScoreDisplay> createState() => _ScoreDisplayState();
}

class _ScoreDisplayState extends State<ScoreDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _rotationAnimation = Tween<double>(begin: 10, end: 60).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    List<int> rounds = [1, 2, 3, 4, 5];
    List<int> player1score = [1, 2, 3, 4, 5];
    List<int> player2score = [1, 2, 3, 4, 5];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Round'),
                  for (int i = 1; i < rounds.length + 1; i++)
                    Text('Round : $i'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Player 01'),
                  for (var score in player1score) Text(score.toString())
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Player 02'),
                  for (var score in player2score) Text(score.toString())
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget getDice() {
    return RotationTransition(
      turns: _rotationAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Image.asset(
          'assets/images/dice-$diceNum.png',
          width: 200,
        ),
      ),
    );
  }

  int diceNum = 0;
  void rollDice() {
    setState(() {
      diceNum = Random().nextInt(6) + 1;
    });
  }
}
