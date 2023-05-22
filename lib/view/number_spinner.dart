import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberSpinner extends StatelessWidget{
  final VoidCallback fIncrease;
  final VoidCallback fDecrease;
  final int number;

  const NumberSpinner({super.key, required this.number,
    required this.fDecrease, required this.fIncrease});

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        IconButton(
          onPressed: fDecrease,
          icon: const Icon(Icons.remove)
        ),
        Text("$number"),
        IconButton(
          onPressed: fIncrease,
          icon: const Icon(Icons.add)
        )
      ],
    );
  }
}