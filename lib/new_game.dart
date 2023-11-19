import 'package:flutter/material.dart';
import 'package:roller_dice/constants.dart';
import 'package:roller_dice/roller_dicer.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  bool isNewgameStarted = false;

  @override
  Widget build(BuildContext context) {
    return isNewgameStarted
        ? Column(
            children: [
              const Center(child: RollerDice()),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isNewgameStarted = false;
                  });
                },
                child: const Text(
                  '< Back to Home',
                  style: TextStyle(color: Colors.blue, fontSize: 24),
                ),
              )
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 200),
                child: Text(
                  'New Game',
                  style: TextStyle(
                    color: kThemeColorWhite,
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.only(top: 100),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isNewgameStarted = true;
                    });
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: kThemeColorRed,
                      foregroundColor: kThemeColorWhite,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 30)),
                  child: const Text('Start'),
                ),
              )
            ],
          );
  }
}
