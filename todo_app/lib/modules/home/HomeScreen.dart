import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: onPressedNotification,
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: onPressedSearch,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(38.0),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://p1.pxfuel.com/preview/50/701/227/daisy-nature-glower-flora-royalty-free-thumbnail.jpg'),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    child: Text(
                      'Flower',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.black12,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'First A',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  'First B',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  'First C',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.red,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    'Second A',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'Second B',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'Second B',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'Second B',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'Second B',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'Second B',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'Second B',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressedNotification() {}
  void onPressedSearch() {}
}
