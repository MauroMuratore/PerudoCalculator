import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perudo_calculator/cubit/call_dice_cubit.dart';
import 'package:perudo_calculator/cubit/my_dice_cubit.dart';
import 'package:perudo_calculator/cubit/total_dice_cubit.dart';
import 'package:perudo_calculator/view/perudo_view.dart';
import 'package:perudo_calculator/view/total_dice_widget.dart';

class PerudoPage extends StatelessWidget{
  const PerudoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => TotalDiceCubit(),
        ),
        BlocProvider(
            create: (BuildContext context) => CallDiceCubit()
        ),
        BlocProvider(
            create: (BuildContext context) => MyDiceCubit()
        )
      ],
      child: PerudoView(),
    );
  }

}