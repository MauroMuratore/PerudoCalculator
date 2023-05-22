import 'package:bloc/bloc.dart';

class TotalDiceCubit extends Cubit<int> {
  TotalDiceCubit() : super(1);
  final int lowerBound =1;
  final int upperBound =30;
  void increment() => state < upperBound ? emit(state+1) : emit(state);
  void decrement() => state > lowerBound ? emit(state-1) : emit(state);
}
