import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final bool isFemale ;
  final double height ;
  final int weight ;
  final int age ;
  final double result ;

  const BMIResultScreen({Key? key, required this.isFemale, required this.height, required this.weight, required this.age, required this.result}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'BMI RESULT',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Are',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.grey.shade900,),
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
                child: Text('${age} years old ${isFemale ? 'Female' : 'Male'} with height ${height.round()} cm and ${weight} kg',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100, fontSize: 15),
                textAlign: TextAlign.center,) ,
              ),
            ),
            SizedBox(height: 30.0,),
            Text(
              'BMI RESULT',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.grey.shade900,),
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 80.0),
                child: Text('BMI : ${result.round()}',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100, fontSize: 15),
                  textAlign: TextAlign.center,)  ,
              ),
            ),

          ],
        ),
      ),
    );
  }



}
