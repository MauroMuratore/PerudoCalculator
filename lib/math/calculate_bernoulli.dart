import 'dart:math';

import 'package:perudo_calculator/cubit/call_dice_cubit.dart';
import 'package:statistical_dart/statistical_dart.dart';

class CalculateBernoulli{

  double calculateProbabilties(int totalDice, Call<int, int> call, List<int> myDice){
    int face = call.face;
    print("face $face");
    int myFaceDice = myDice.where((element) {
      return element==face || element==1;
    }).length;
    print("myFaceDice $myFaceDice");
    print("my dice ${myDice.toString()}");
    int numberCall = call.number - myDice.where((element) {
      return element==face || element==1;
    } ).length;
    print("call $numberCall");
    if(numberCall<=0){ return 100;}
    int total = totalDice - myDice.length;
    print(total);
    if(total <= 0 ){ return 0;}
    double probability = face == 1 ? 1/6 : 1/3;
    double ritorno = 0;
    double totalFactorial = factorial(total);
    for(int i=numberCall; i<=total; i++){
      ritorno = ritorno + binomial(total, i, totalFactorial ,probability) ;
      print("for - $i $ritorno");
    }
    return ritorno*100;
  }

  double calculateCalzata(int totalDice, Call<int, int> call, List<int> myDice){
    int face = call.face;
    print("face $face");
    int myFaceDice = myDice.where((element) {
      return element==face || element==1;
    }).length;
    print("myFaceDice $myFaceDice");
    print("my dice ${myDice.toString()}");
    int numberCall = call.number - myDice.where((element) {
      return element==face || element==1;
    } ).length;
    print("call $numberCall");
    if(numberCall<0){ return 0;}
    int total = totalDice - myDice.length;
    print("total $total");
    if(total <= 0 ){ return 0;}
    double probability = face == 1 ? 1/6 : 1/3;
    double totalFactorial = factorial(total);
    double ritorno = 100;
    return ritorno * binomial(total, numberCall, totalFactorial, probability);

  }



  double factorial(int number){
    double ritorno=1;
    for(int i=2;i<=number;i++){
      ritorno = ritorno * i;
    }
    return ritorno;
  }

  num binomial(int total, int success, double totalFactorial, double prob){
    num ritorno = 0;
    double successFact = factorial(success);
    double insuccessFact = factorial(total - success);
    num successProb = pow(prob, success);
    num insuccessProb = pow(1-prob, total-success);
    ritorno = totalFactorial/(successFact*insuccessFact) *successProb*insuccessProb;
    print("binomial fact $ritorno");
    return ritorno;
  }


}