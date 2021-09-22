import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class ToDoHome extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var textControoler = TextEditingController();
  var timeControoler = TextEditingController();
  var dateControoler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ToDoAppCubit()..createAndOpenDataBase() ,
      child: BlocConsumer<ToDoAppCubit,ToDoAppStates>(
        listener: (BuildContext context, state) {
          if(state is ToDoInsertInDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, Object? state) {
          ToDoAppCubit cubit = ToDoAppCubit.getBloc(context);
          return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  cubit.insertToDatabase(
                      date: dateControoler.text,
                      time: timeControoler.text,
                      title: textControoler.text);
                }
              }
              else {
                scaffoldKey.currentState!
                    .showBottomSheet((context) => Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.grey[100],
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        defaultTextFormField(
                            controller: textControoler,
                            keyboardType: TextInputType.text,
                            labelText: 'Title.',
                            prefixIcon: Icon(Icons.title),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Title Must not be Empty';
                              }
                            }),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultTextFormField(
                            controller: timeControoler,
                            keyboardType: TextInputType.datetime,
                            labelText: 'time.',
                            prefixIcon: Icon(Icons.watch_later_outlined),
                            onTap: () {
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                                  .then((value) => timeControoler.text =
                                  value!.format(context));
                            },
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Time Must not be Empty';
                              }
                            }),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultTextFormField(
                            controller: dateControoler,
                            keyboardType: TextInputType.datetime,
                            labelText: 'Date.',
                            prefixIcon: Icon(Icons.calendar_today),
                            onTap: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate:
                                  DateTime.parse('2021-12-30'))
                                  .then((value) => dateControoler.text =
                                  DateFormat.yMMMd().format(value!));
                            },
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Date Must not be Empty';
                              }
                            }),
                      ],
                    ),
                  ),
                ))

                //.closed refer to closing bottomsheet manually drag down.
                    .closed
                    .then((value) {
                  cubit.changeFabIcon(
                      isBSheetShown: false,
                      icon: Icon(Icons.add));
                });
                cubit.changeFabIcon(
                    isBSheetShown: true,
                    icon: Icon(Icons.check));
              }
            },
            child: cubit.fabIcon,
          ),
          bottomNavigationBar: BottomNavigationBar(

            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomBarIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle), label: 'Done'),
              BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archived'),
            ],
          ),
          body: state is! ToDoLoadingCircleState ? cubit.screens[cubit.currentIndex] : Center(child: CircularProgressIndicator(),),
        );
        },

      ),
    );
  }




}

