import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perudo_calculator/cubit/call_dice_cubit.dart';
import 'package:perudo_calculator/view/dice_spinner.dart';
import 'package:perudo_calculator/view/number_spinner.dart';

class CallDiceWidget extends StatelessWidget{
  const CallDiceWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Row(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(15),
          child: Text("Call "),
        ),
        BlocBuilder<CallDiceCubit, Call<int, int>>(
          builder: (context, state){
             return Padding(
               padding: const EdgeInsets.all(15),
               child: Row(
                  children: [
                    NumberSpinner(
                        number: state.number,
                        fDecrease: ()=> context.read<CallDiceCubit>().decrementNumber(),
                        fIncrease: ()=> context.read<CallDiceCubit>().incrementNumber()
                    ),
                    DiceSpinner(
                        faceDice: state.face,
                        fDecrease: ()=> context.read<CallDiceCubit>().decrementDice(),
                        fIncrease: ()=> context.read<CallDiceCubit>().incrementDice(),
                    ),
                  ],
               )
             );
          }
        )
      ],
    );
  }
}