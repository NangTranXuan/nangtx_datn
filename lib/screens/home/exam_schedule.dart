import 'package:flutter/material.dart';

class ExamSchedule extends StatelessWidget {
  const ExamSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child:  Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( "Exam Type",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),),
              SizedBox(height: 50.0,),
              Center(child: Text(
                "No Exam For Now.",
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
