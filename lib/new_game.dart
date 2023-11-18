import 'package:flutter/material.dart';
import 'package:roller_dice/constants.dart';

class NewGame extends StatefulWidget {
  const NewGame({super.key});

  @override
  State<NewGame> createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  
  bool isNewgameStarted = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'New Game',
          style: TextStyle(color: kThemeColorRed),
        ),
        TextButton(
          onPressed: null,
          child: Text('New Game'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
        )
      ],
    );
  }
}
