

import 'package:flutter/material.dart';
import 'package:flutter_app/modules/counter/cubit/cubit.dart';
import 'package:flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer <AppCubit , AppStates>(
        builder: (context , state) => Scaffold(
          appBar: AppBar(
            title: Text('counter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${AppCubit.getBloc(context).counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: ()=>AppCubit.getBloc(context).plusCounter(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
        listener: (context , state){
          if(state is SecondState) {print('${state.counter}');}
        },

      ),
    );
  }

}
