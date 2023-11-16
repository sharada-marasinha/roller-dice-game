import 'dart:math';

import 'package:flutter/material.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({Key? key}) : super(key: key);
  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  int currentPlayer = 1;
  int player1Score = 0;
  int player2Score = 0;
  int currentRound = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _rotationAnimation = Tween<double>(begin: 10, end: 60).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  int diceNum = 1;
  void roll() {
    setState(() {
      if (_rotationAnimation.isCompleted) {
        diceNum = Random().nextInt(6) + 1;
      }
    });

    _controller.reset();
    _controller.forward();

    if (currentPlayer == 1) {
      player1Score += diceNum;
    } else {
      player2Score += diceNum;
    }

    currentPlayer = (currentPlayer == 1) ? 2 : 1;
    if (currentRound == 5) {
      int winner = (player1Score > player2Score) ? 1 : 2;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text('Player $winner wins!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame();
                },
                child: Text('Play Again'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: resetGame,
                child: Text('Restart Game'),
              ),
            ],
          );
        },
      );
    } else {
      currentRound++;
    }
  }

  void resetGame() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
      currentRound = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
getResetButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [getScoreCard()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            getDice(),
          ],
        ),
        SizedBox(height: 50.0),
        getButton()
      ],
    );
  }

  Widget getResetButton() {
    return Container(
      alignment: Alignment.topCenter,
      child: IconButton(
        onPressed: resetGame,
        icon: Icon(Icons.refresh),
        iconSize: 36.0,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }

  Widget getButton() {
    return Container(
           
  alignment: Alignment.bottomCenter,
      child: TextButton(
          onPressed: roll,
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28)),
          child: const Text('Role Once')),
    );
  }

  Widget getDice() {
    return RotationTransition(
      turns: _rotationAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Image.asset(
          'assets/images/dice-$diceNum.png',
          width: 130,
        ),
      ),
    );
  }

  Widget getScoreCard() {
    return Card(
      color: Colors.green[400],
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Player $currentPlayer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Player 1 Score: $player1Score',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Player 2 Score: $player2Score',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
