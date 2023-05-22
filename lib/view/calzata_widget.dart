import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perudo_calculator/cubit/call_dice_cubit.dart';
import 'package:perudo_calculator/cubit/my_dice_cubit.dart';
import 'package:perudo_calculator/cubit/total_dice_cubit.dart';
import 'package:perudo_calculator/math/calculate_bernoulli.dart';

class CalzataWidget extends StatefulWidget {
  const CalzataWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CalzataState();
}

class _CalzataState extends State<CalzataWidget>{
  String _value = "0%";
  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        TextButton(
          onPressed: () => updateText(
            totalDice: BlocProvider.of<TotalDiceCubit>(context).state,
            call: BlocProvider.of<CallDiceCubit>(context).state,
            myDice: BlocProvider.of<MyDiceCubit>(context).state,
          ),
          child: const Text("Calzata"),

        ),
        Text(_value),
      ],
    );
  }

  void updateText({required int totalDice, required Call<int, int> call,
    required List<int> myDice}){
    final CalculateBernoulli cb = CalculateBernoulli();
    double prob =cb.calculateCalzata(totalDice, call, myDice);
    setState(() {
      _value = "${prob.toStringAsFixed(3)}%";
    });

  }
}