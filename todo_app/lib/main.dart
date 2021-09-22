import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'layout/todolayout/ToDoHome.dart';
import 'modules/counter/counter.dart';
import 'shared/blocobserver.dart';
import 'modules/bmiresult/BMIResultScreen.dart';
import 'modules/bmi/Calculator.dart';
import 'modules/home/HomeScreen.dart';
import 'modules/login/LoginScreen.dart';
import 'modules/messenger/MessengerScreen.dart';
import 'modules/user/UserScreen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

