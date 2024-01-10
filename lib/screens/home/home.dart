import 'package:datn_test/constants/app_colors.dart';
import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/constants/time.dart';
import 'package:datn_test/screens/home_screen_item/FUNCTIONS.dart';
import 'package:datn_test/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:datn_test/constants/route.dart';
import 'dart:convert';

import '../../globals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var lessonData;
  // var taskData;
  // List<Container> lessonTodayItems = [];
  // List<Container> taskItems = [];

  // void initState() {
  //   super.initState();
  //   Future.microtask(() {
  //     getLesson();
  //     getTask();
  //   });
  // }

  // Future getLesson() async {
  //   var response = await http.post(
  //     Uri.parse(urlLesson),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${globals.accessToken}',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'type': '1',
  //     }),
  //   );

  //   setState(() {
  //     lessonData = jsonDecode(response.body);
  //     for (int i = 0; i < lessonData.length; i++) {
  //       for (var j = 0; j < lessonData[i]['lessons'].length; j++) {
  //         lessonTodayItems.add(buildClassItem(
  //             context,
  //             DateTime.parse(lessonData[i]['lessons'][j]['start_time'])
  //                     .hour
  //                     .toString() +
  //                 ":" +
  //                 DateTime.parse(lessonData[i]['lessons'][j]['start_time'])
  //                     .minute
  //                     .toString(),
  //             DateTime.parse(lessonData[i]['lessons'][j]['start_time']).hour <
  //                 12,
  //             lessonData[i]['name'] +
  //                 " (" +
  //                 lessonData[i]['lessons'][j]['lesson_name'] +
  //                 ")",
  //             lessonData[i]['room']['name'] + address,
  //             lessonData[i]['teacher']['first_name'] +
  //                 " " +
  //                 lessonData[i]['teacher']['last_name']));
  //       }
  //     }
  //   });
  // }

  // Future getTask() async {
  //   var response = await http.get(
  //     Uri.parse(urlTask),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${globals.accessToken}',
  //     },
  //   );

  //   setState(() {
  //     taskData = jsonDecode(response.body);
  //     for (int i = 0; i < taskData.length; i++) {
  //       for (var j = 0; j < taskData[i]['homeworks'].length; j++) {
  //         taskItems.add(buildTaskItem(
  //             "Homework",
  //             getTimeLeft(taskData[i]['homeworks'][j]['start_time']),
  //             taskData[i]['name'],
  //             taskData[i]['homeworks'][j]['homework_name'],
  //             getColorLeft(taskData[i]['homeworks'][j]['start_time']),
  //             true));
  //       }
  //       for (var j = 0; j < taskData[i]['exams'].length; j++) {
  //         taskItems.add(buildTaskItem(
  //           "Exam",
  //           getTimeLeft(taskData[i]['exams'][j]['start_time']),
  //           taskData[i]['name'],
  //           taskData[i]['exams'][j]['exam_name'],
  //           getColorLeft(taskData[i]['exams'][j]['start_time']),
  //           false,
  //         ));
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFD4E7FE),
                    Color(0xFFF0F0F0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.6, 0.3])),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: TextSpan(
                    text: getWeekDayString(DateTime.now().weekday) + ', ',
                    style: TextStyle(
                      color: AppColors.kBlueClr,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                    children: [
                      TextSpan(
                        text: DateTime.now().day.toString() +
                            ' ' +
                            getMonthString(DateTime.now().month) +
                            ' ' +
                            DateTime.now().year.toString(),
                        style: TextStyle(
                          color: AppColors.kBlueClr,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 8,
                        )
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("assets/icons/avatar.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi " + globals.fullName,
                        style: TextStyle(
                          fontSize: fontSizeText * 1.5,
                          fontWeight: FontWeight.w900,
                          color: Color(0XFF343E87),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Here is a list of schedule",
                        style: TextStyle(
                          fontSize: fontSizeText * 0.95,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "You need to check...",
                        style: TextStyle(
                          fontSize: fontSizeText * 0.95,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 185,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: MediaQuery.of(context).size.height - 245,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                buildTitleRow("YOUR FUNCTIONS", 6),
                SizedBox(
                  height: 20,
                ),
                MainFunction(),
                SizedBox(
                  height: 20,
                ),
                buildTitleRow("SCHEDULE TODAY", lessonTodayItems.length),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: lessonTodayItems,
                ),
                SizedBox(
                  height: 10,
                ),
                buildTitleRow("YOUR TASKS", taskItems.length),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...taskItems,
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
