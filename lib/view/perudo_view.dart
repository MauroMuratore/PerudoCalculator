import 'package:flutter/cupertino.dart';
import 'package:perudo_calculator/view/call_dice_widget.dart';
import 'package:perudo_calculator/view/calzata_widget.dart';
import 'package:perudo_calculator/view/my_dice_widget.dart';
import 'package:perudo_calculator/view/probability_widget.dart';
import 'package:perudo_calculator/view/total_dice_widget.dart';

class PerudoView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  const <Widget>[
        TotalDiceWidget(),
        CallDiceWidget(),
        Text("Your dices"),
        MyDiceWidget(),
        ProbabilityWidget(),
        CalzataWidget(),
      ],
    );
  }

}