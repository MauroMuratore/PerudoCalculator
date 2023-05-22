import 'package:bloc/bloc.dart';

class CallDiceCubit extends Cubit<Call<int, int>> {
  CallDiceCubit() : super(Call(1,1));
  final upperNumber = 30;
  final upperDice = 6;
  final lowerBound = 1;

  void incrementNumber() => state.number < upperNumber ?
    emit(Call(state.number+1, state.face)) : emit(state);
  void decrementNumber() => state.number > lowerBound ?
    emit(Call(state.number-1, state.face)) : emit(state);
  void incrementDice() => state.face < upperDice ?
      emit(Call(state.number, state.face+1)) : emit(state);
  void decrementDice() => state.face > lowerBound ?
      emit(Call(state.number, state.face-1)) : emit(state);
}

class Call<E,F>{
  E number;
  F face;

  Call(this.number, this.face);
}