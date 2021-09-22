import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';

Widget defaultButton({
  double buttonWidth = double.infinity,
  Color buttonColor = Colors.blue,
  required Function() buttonFunction,
  required String buttonText,
}) =>
    Container(
      width: buttonWidth,
      color: buttonColor,
      child: MaterialButton(
        onPressed: buttonFunction,
        child: Text(
          buttonText.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

//----------------------------------------------------------------------------

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText,
  required String? Function(String?)? validator,
  Icon? prefixIcon,
  Icon? suffixIcon,
  ValueChanged<String>? onSubmit,
  Function(String)? onChange,
  bool obscureText = false,
  VoidCallback? suffixFun,
  Function()? onTap,
}) =>
    TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null ? IconButton(icon: suffixIcon, onPressed: suffixFun,) : null ,
      ),
      keyboardType: keyboardType,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      obscureText: obscureText,
    );

//------------------------------------------------

enum WhyFarther {delete,archive}
Widget activeTaskItem (Map oneTask , context) => Container(
  padding: EdgeInsets.all(15.0),
  child:   Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      IconButton(onPressed: () {
        ToDoAppCubit.getBloc(context).updateDataFromDatabase(status: "done", id: oneTask['id']);

      }, icon: Center(child: CircleAvatar(child: Icon(Icons.done) , radius: 50.0,)),),
      SizedBox(width: 15.0,),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              child: Text(
                '${oneTask['title']}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

              ),
            ),
            SizedBox(height: 4,),
            Text(
              '${oneTask['time']}' +',   '+ '${oneTask['date']}',
              style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.black54
              ),),
          ],
        ),
      ),
      SizedBox(width: 10.0,),
      PopupMenuButton<WhyFarther>(
        onSelected: (WhyFarther result) {
          if(result.index == 1){
            ToDoAppCubit.getBloc(context).updateDataFromDatabase(status: "archive", id: oneTask['id']);
          }
          else  ToDoAppCubit.getBloc(context).deleteDataFromDatabase( id: oneTask['id']);


        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.delete,
            child: Text('delete'),
          ),
          const PopupMenuItem<WhyFarther>(
            value: WhyFarther.archive,
            child: Text('archive'),
          ),
        ],
      ),
    ],
  ),
) ;

//=============================================================


enum doneTaskoptions {delete,archive}
Widget doneTaskItem (Map oneTask , context) => Container(
  padding: EdgeInsets.all(15.0),
  child:   Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(Icons.check_circle, color: Colors.green,),
      SizedBox(width: 15.0,),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              child: Text(
                '${oneTask['title']}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

              ),
            ),
            SizedBox(height: 4,),
            Text(
              '${oneTask['time']}' +',   '+ '${oneTask['date']}',
              style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.black54
              ),),
          ],
        ),
      ),
      SizedBox(width: 10.0,),
      PopupMenuButton<doneTaskoptions>(
        onSelected: (doneTaskoptions result) {
          if(result.index == 1){
            ToDoAppCubit.getBloc(context).updateDataFromDatabase(status: "archive", id: oneTask['id']);
          }
          else  ToDoAppCubit.getBloc(context).deleteDataFromDatabase( id: oneTask['id']);


          },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<doneTaskoptions>>[
          const PopupMenuItem<doneTaskoptions>(
            value: doneTaskoptions.delete,
            child: Text('delete'),
          ),
          const PopupMenuItem<doneTaskoptions>(
            value: doneTaskoptions.archive,
            child: Text('archive'),
          ),
        ],
      ),
    ],
  ),
) ;


//=============================================================


enum archiveTaskoptions {delete}
Widget ArchiveTaskItem (Map oneTask , context) => Container(
  padding: EdgeInsets.all(15.0),
  child:   Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(Icons.archive_rounded, color:Colors.grey[500],),
      SizedBox(width: 15.0,),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              child: Text(
                '${oneTask['title']}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,

              ),
            ),
            SizedBox(height: 4,),
            Text(
              '${oneTask['time']}' +',   '+ '${oneTask['date']}',
              style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.black54
              ),),
          ],
        ),
      ),
      SizedBox(width: 10.0,),
      PopupMenuButton<archiveTaskoptions>(
        onSelected: (archiveTaskoptions result) {
          if(result.index == 0){
            ToDoAppCubit.getBloc(context).deleteDataFromDatabase( id: oneTask['id']);
        }

        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<archiveTaskoptions>>[
          const PopupMenuItem<archiveTaskoptions>(
            value: archiveTaskoptions.delete,
            child: Text('delete'),
          ),
        ],
      ),
    ],
  ),
) ;