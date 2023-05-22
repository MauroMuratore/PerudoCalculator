import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perudo_calculator/cubit/call_dice_cubit.dart';
import 'package:perudo_calculator/cubit/my_dice_cubit.dart';
import 'package:perudo_calculator/cubit/total_dice_cubit.dart';
import 'package:perudo_calculator/math/calculate_bernoulli.dart';

class ProbabilityWidget extends StatefulWidget {
  const ProbabilityWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ProbabilityState();
}

class _ProbabilityState extends State<ProbabilityWidget>{
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
          child: const Text("Probability"),

        ),
        Text(_value),
      ],
    );
  }

  void updateText({required int totalDice, required Call<int, int> call,
    required List<int> myDice}){
    final CalculateBernoulli cb = CalculateBernoulli();
    double prob =cb.calculateProbabilties(totalDice, call, myDice);
    setState(() {
      _value = "${prob.toStringAsFixed(3)}%";
    });

  }
}