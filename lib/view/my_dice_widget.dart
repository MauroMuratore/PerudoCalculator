import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perudo_calculator/cubit/my_dice_cubit.dart';
import 'package:perudo_calculator/view/dice_spinner.dart';

class MyDiceWidget extends StatefulWidget{
  const MyDiceWidget({super.key});
  @override
  State<StatefulWidget> createState() => _MyDiceWidgetState();
}

class _MyDiceWidgetState extends State<MyDiceWidget>{
  final int maxDice=6;
  final int minDice=1;
  List<int> dices = List.generate(1, (index) => 1);
  void addDice(VoidCallback callback){
    setState(() {
      if(dices.length < maxDice){
        dices.add(1);
      }
    });
    callback();
  }
  void removeDice(VoidCallback callback){
    setState(() {
      if(dices.length >minDice){
        dices.removeLast();
      }
    });
    callback();
  }

  void increaseFace(int index, Function(int) callback){
    setState(() {
      if(dices[index]<maxDice) {
        dices[index] = dices[index] + 1;
      }
    });
    callback(index);
  }

  void decreaseFace(int index, Function(int) callback){
    setState(() {
      if(dices[index]>minDice){
        dices[index] = dices[index] - 1;
      }
    });
    callback(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: EdgeInsets.zero,
        child: BlocBuilder<MyDiceCubit, List<int>>(
          builder: (context, state){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => removeDice(context.read<MyDiceCubit>().decrementNumber),
                  icon: const Icon(Icons.remove),
                ),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dices.length,
                        itemBuilder: (BuildContext context2, int index){
                          return DiceSpinner(
                            faceDice: dices[index],
                            fDecrease: () => decreaseFace(index,(index)=> context.read<MyDiceCubit>().decrementDice(index)),
                            fIncrease: () => increaseFace(index,(index)=> context.read<MyDiceCubit>().incrementDice(index)),
                          );
                        }
                    )
                ),
                IconButton(
                  onPressed: () => addDice(context.read<MyDiceCubit>().incrementNumber),
                  icon: const Icon(Icons.add),
                ),

              ],
            );
          },
        )

    );
  }
}

