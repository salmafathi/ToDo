
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/archivedtasks/ArchivedTasks.dart';
import 'package:flutter_app/modules/todo_newtasks/DoneTasks.dart';
import 'package:flutter_app/modules/tasks/Tasks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class ToDoAppCubit extends Cubit<ToDoAppStates>{
  ToDoAppCubit() : super(ToDoAppInitialState());

  static ToDoAppCubit getBloc (context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    Tasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];

  List<String> titles = ['Active Tasks', 'Done Tasks', 'Archived Tasks'];


  void changeBottomBarIndex(int index){
    currentIndex = index ;
    emit(ToDoBottomNavBarState());
  }



  //======DataBase

  late Database database;
  List<Map> activeTasks =[];
  List<Map> doneTasks =[];
  List<Map> archiveTasks =[];

  void createAndOpenDataBase()  {
    print('open database');
      openDatabase(
      'todo.db',
      version: 1,
      onCreate: (db, version) {
        print('Database Created.');
        db
            .execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) => print('Table Created'))
            .catchError((error) {
          print(error);
        });
      },
      onOpen: (db) {
        getDataFromDatabase(db);
        print('Database opened.');
      },
    ).then((value) {
      database = value ;
      emit(ToDoCreateAndOpenDataBaseState());
    });
  }

   insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
     await database.transaction((txn) {
        txn
            .rawInsert(
            'INSERT INTO tasks (title, date, time , status) VALUES ("$title","$date","$time","active")')
            .then((value) {
              emit(ToDoInsertInDatabaseState());
              getDataFromDatabase(database);
              print('$value Row data inserted successfully !');
            })
            .catchError((Error) {
          print(Error.toString());
        });
        return null;
      });
  }


  void getDataFromDatabase (db)  {

    activeTasks = [] ;
    doneTasks = [] ;
    archiveTasks = [] ;

    emit(ToDoLoadingCircleState());
    db.rawQuery('SELECT * FROM tasks').then((value) {
      print(value);
      value.forEach((element) {
          if(element['status']=='active'){
            activeTasks.add(element) ;
          }
          else if(element['status']=='done'){
            doneTasks.add(element) ;
          }
          else archiveTasks.add(element) ;
      });
      emit(ToDoGetDataFromDatabaseState());
    });

  }


  void updateDataFromDatabase ({
    required String status,
    required int id ,
}) async {
     await database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', '$id'],
    ).then((value) {
       getDataFromDatabase(database);
       emit(ToDoUpdateDatabaseState());

     });
  }

  void deleteDataFromDatabase ({
    required int id ,
  }) async {
    await database.rawDelete(
      'DELETE FROM tasks WHERE id = ?', [id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(ToDoDeleteDatabaseState());

    });
  }

//============================================================


  bool isBottomSheetShown = false;
  Icon fabIcon = Icon(Icons.add);

  void changeFabIcon({
    required bool isBSheetShown ,
    required Icon icon,
}){
    isBottomSheetShown = isBSheetShown ;
    fabIcon = icon ;
    emit(ToDofabIconChangeState());
  }



  void popUpOpenOptionMenu(){

  }
}