import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      duration: const Duration(seconds: 2),
    );

    _rotationAnimation = Tween<double>(begin: 10, end: 60).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  final Random _random = Random();
  int diceNum = 0;
  // -----------------------------------ROLL-------------------------------------------------
  void roll() {
    _controller.reset();
    _controller.forward();
    // ----------------------------------------That for 2 Players----------------------------
    // if (currentPlayer == 1) {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.portraitUp,
    //   ]);
    // } else {
    //   SystemChrome.setPreferredOrientations([
    //     DeviceOrientation.portraitDown,
    //   ]);
    // }

    setState(() {
      diceNum = _random.nextInt(6) + 1;
    });

    if (selectedOption == 'MAX') {
      if (diceNum == 4 || diceNum == 5 || diceNum == 6) {
        print('MAX---$diceNum');
        if (currentPlayer == 1) {
          player1Score += 10;
        } else {
          player2Score += 10;
        }
      } else {
        print('No Marks');
      }
    } else if (selectedOption == 'MIN') {
      if (diceNum == 1 || diceNum == 2 || diceNum == 3) {
        print('MIN---$diceNum');
        if (currentPlayer == 1) {
          player1Score += 10;
        } else {
          player2Score += 10;
        }
      } else {
        print('No Marks');
      }
    }
    currentPlayer = (currentPlayer == 1) ? 2 : 1;
    if (currentRound == 5) {
      int winner = (player1Score > player2Score) ? 1 : 2;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over !'),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getScoreCard(),
        const SizedBox(height: 50.0),
        getDice(),
        const SizedBox(height: 50.0),
        getOptions(),
        getButton(),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Widget getResetButton() {
    return Container(
      alignment: Alignment.topLeft,
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
              backgroundColor: const Color.fromARGB(255, 243, 33, 33),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
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
          width: 200,
        ),
      ),
    );
  }

  Widget getScoreCard() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            Text(
              'Player | 0$currentPlayer',
              style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Round - 5 / $currentRound',
              style: const TextStyle(
                color: Color.fromARGB(255, 197, 0, 0),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Text(
                  'Player 01 Score :- $player1Score',
                  style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Player 02 Score :- $player2Score',
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String selectedOption = 'MAX';
  bool isToggleButtonEnabled = false;
  Widget getOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          activeColor: Colors.red,
          value: 'MAX',
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value.toString();
              isToggleButtonEnabled = true;
            });
          },
        ),
        const Text('MAX ? ',
            style: TextStyle(color: Colors.white, fontSize: 25)),
        Radio(
          activeColor: Colors.red,
          value: 'MIN',
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value.toString();
              isToggleButtonEnabled = true;
            });
          },
        ),
        const Text('MIN ?',
            style: TextStyle(color: Colors.white, fontSize: 25)),
      ],
    );
  }
}
