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
        colors: [Color.fromARGB(255, 0, 122, 221), Color.fromARGB(255, 0, 253, 0)],
        begin: beginAlignment,
        end: endAlignment,
      )),
      child:const RollerDice(),
      
    );
  }
}
