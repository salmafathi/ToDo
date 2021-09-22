import 'package:flutter/material.dart';
import 'package:flutter_app/models/usermodel/user.dart';

class UserScreen extends StatelessWidget {

  List<UserModel> users = [
    UserModel(id:1,name: 'salmaaa1',number: 010025478),
    UserModel(id:2,name: 'salmaaa2',number: 01002544518),
    UserModel(id:3,name: 'salmaaa3',number: 010024755478),
    UserModel(id:4,name: 'salmaaa4',number: 01002525478),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index)=>buildUserItem(users[index]),
            separatorBuilder: (BuildContext context, int index)=>buildSeparatorItem(),
            itemCount: users.length)
      ),
    );
  }


  Widget buildUserItem(UserModel user)=>Row(
    children: [
      CircleAvatar(
        radius: 25.0,
        backgroundColor: Colors.blue,
        child: Text('${user.id}',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),

      SizedBox(width: 20.0,),

      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${user.name}',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),),
          Text('${user.number}' , style: TextStyle(color: Colors.grey),),
        ],
      ),
    ],
  );

  Widget buildSeparatorItem()=>Container(
    height: 1.0,
    width: double.infinity,
    color: Colors.grey[300],
  );

}


