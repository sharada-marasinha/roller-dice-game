import 'package:flutter/material.dart';
import 'package:roller_dice/gradient_container.dart';

class RollediceApp extends StatelessWidget {
  const RollediceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 134, 99, 2),
          title: const Text('Roller Dice...'),
          centerTitle: true,
        ),
        body: const GradientContainer(),
      ),
    );
  }
}
