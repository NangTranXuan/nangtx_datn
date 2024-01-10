import 'package:datn_test/screens/home_screen_item/exam_schedule.dart';
import 'package:datn_test/screens/home_screen_item/home_work.dart';
import 'package:datn_test/screens/home_screen_item/results.dart';
import 'package:flutter/material.dart';

class MainFunction extends StatefulWidget {
  const MainFunction({Key? key}) : super(key: key);

  @override
  _MainFunctionState createState() => _MainFunctionState();
}

class _MainFunctionState extends State<MainFunction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeWork()),
                );
              },
              title: "Home Work",
              icon: "assets/icons/house.png",
            ),
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeWork()),
                );
              },
              title: "Attendance",
              icon: "assets/icons/attendance.png",
            ),
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsScreen()),
                );
              },
              title: "Results",
              icon: "assets/icons/results.png",
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeWork()),
                );
              },
              title: "Payments",
              icon: "assets/icons/payment.png",
            ),
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamSchedule()),
                );
              },
              title: "Exam",
              icon: "assets/icons/exam.png",
            ),
            CustomIconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeWork()),
                );
              },
              title: "Complaints",
              icon: "assets/icons/complain.png",
            ),
          ],
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({required this.onPressed, this.title, required this.icon});
  final GestureTapCallback onPressed;
  final title;
  final icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                icon,
                height: 50,
                width: 50,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
        onPressed: onPressed,
        shape: const StadiumBorder(),
      ),
    );
  }
}
