import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceSpinner extends StatelessWidget{
  final VoidCallback fIncrease;
  final VoidCallback fDecrease;
  final int faceDice;

  const DiceSpinner({super.key, required this.faceDice,
    required this.fDecrease, required this.fIncrease});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        IconButton(
            onPressed: fIncrease,
            icon: const Icon(Icons.arrow_upward),
        ),
        _buildDice(),
        IconButton(
            onPressed: fDecrease,
            icon: const Icon(Icons.arrow_downward)),
      ],
    );
  }

  Widget _buildDice() {
    String pathDice = "assets/images/${faceDice}_dice_red.png";
    return Image.asset(
      pathDice,
      height: 40,
      width: 40,
    );
  }
}