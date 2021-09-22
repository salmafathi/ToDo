import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoAppCubit,ToDoAppStates>(
      builder: (BuildContext context, state) {
        var tasks = ToDoAppCubit.getBloc(context).archiveTasks;
        if (tasks.isEmpty )  { return Center(child: Text('No Archived Tasks Yet !', style: TextStyle(color: Colors.grey[500],),),) ;}
        else
        return ListView.separated(
            itemBuilder: (context,index)=> ArchiveTaskItem(tasks[index],context),
            separatorBuilder: (context,builder)=> Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: tasks.length
        );

      },
      listener: (BuildContext context, Object? state) {  },

    );


  }
}
