import 'package:flutter/material.dart';

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:  Text("No Downloads!",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        ),
    );
  }
}
