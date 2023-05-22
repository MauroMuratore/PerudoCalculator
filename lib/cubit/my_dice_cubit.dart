import 'package:bloc/bloc.dart';

class MyDiceCubit extends Cubit<List< int>> {
  MyDiceCubit() : super(List<int>.generate(1, (index) => 1));
  final int lowerBound = 1;
  final int upperBound = 6;

  void incrementNumber(){
    if(state.length < upperBound){
      state.add(1);
    }
    emit(state);
  }

  void decrementNumber(){
    if(state.length > lowerBound){
      state.removeLast();
    }
    emit(state);
  }

  void incrementDice(int index){
    if(state[index] < upperBound){
      state[index] = state[index] +1;
    }
    print("stato incrementato dell'indice $index a ${state[index]}");
    emit(state);
  }

  void decrementDice(int index){
    if(state[index] > lowerBound){
      state[index] = state[index] -1;
    }
    emit(state);
  }
}
