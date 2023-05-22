import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perudo_calculator/cubit/total_dice_cubit.dart';
import 'package:perudo_calculator/view/number_spinner.dart';

class TotalDiceWidget extends StatelessWidget{
  const TotalDiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text("Total number of dice "),
        ),
        BlocBuilder<TotalDiceCubit, int>(
            builder: (context, state){
              return Padding(
                padding: const EdgeInsets.all(15),
                child: NumberSpinner(
                  number: state,
                  fDecrease: () => context.read<TotalDiceCubit>().decrement(),
                  fIncrease: () => context.read<TotalDiceCubit>().increment(),
                ),
              );
            }
        ),
      ],
    );
  }


}