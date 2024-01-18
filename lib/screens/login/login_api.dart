import 'dart:convert';
import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/model/homework.dart';
import 'package:datn_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:datn_test/globals.dart' as globals;
import '../../constants/route.dart';
import '../../constants/time.dart';
import '../../globals.dart';
import '../../widgets/home_item.dart';
import '../../widgets/page_title_bar.dart';
import '../../widgets/upside.dart';

var lessonData;
var taskData;

Future<void> validateAndSubmit(
    String email, String password, BuildContext context) async {
  var response = await http.post(
    Uri.parse(urlLogin),
    body: {
      'email': email,
      'password': password,
    },
  );
  var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  if (response.statusCode == 200) {
    globals.accessToken = jsonResponse["access_token"];
    globals.tokenType = jsonResponse["type_token"];

    //get user
    response = await http.get(
      Uri.parse(urlUser),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );
    jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      if (jsonResponse != null && jsonResponse.containsKey('data')) {
        globals.fullName = jsonResponse['data']['first_name'] +
            ' ' +
            jsonResponse['data']['last_name'];
        globals.email = jsonResponse['data']['email'];
      }
    }

    // get lesson data today
    response = await http.post(
      Uri.parse(urlLesson),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
      body: jsonEncode(<String, String>{
        'type': '1',
      }),
    );

    if (response.statusCode == 200) {
      lessonData = jsonDecode(response.body)['data'];
      for (int i = 0; i < lessonData.length; i++) {
        for (var j = 0; j < lessonData[i]['lessons'].length; j++) {
          lessonHomes.add(buildClassItem(
              context,
              DateTime.parse(lessonData[i]['lessons'][j]['start_time'])
                      .hour
                      .toString() +
                  ":" +
                  DateTime.parse(lessonData[i]['lessons'][j]['start_time'])
                      .minute
                      .toString(),
              DateTime.parse(lessonData[i]['lessons'][j]['start_time']).hour <
                  12,
              lessonData[i]['name'] +
                  " (" +
                  lessonData[i]['lessons'][j]['lesson_name'] +
                  ")",
              lessonData[i]['room']['name'] + address,
              lessonData[i]['teacher']['first_name'] +
                  " " +
                  lessonData[i]['teacher']['last_name']));
        }
      }
    }

    // Get task today
    response = await http.get(
      Uri.parse(urlTask),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      taskData = jsonDecode(response.body)['data'];
      for (int i = 0; i < taskData.length; i++) {
        for (var j = 0; j < taskData[i]['homeworks'].length; j++) {
          taskItems.add(buildTaskItem(
              "Homework",
              getTimeLeft(taskData[i]['homeworks'][j]['start_time']),
              taskData[i]['name'],
              taskData[i]['homeworks'][j]['homework_name'],
              getColorLeft(taskData[i]['homeworks'][j]['start_time']),
              true));
          homeworks.add(Homework(
            name: taskData[i]['homeworks'][j]['homework_name'],
            teacher: taskData[i]['teacher']['first_name'] +
                " " +
                taskData[i]['teacher']['last_name'],
            nameClass: taskData[i]['name'],
            dueDate: taskData[i]['homeworks'][j]['end_time'],
            time: "1 hour",
            imageUrl: getUrlImageClass(taskData[i]['type']),
          ));
        }
        for (var j = 0; j < taskData[i]['exams'].length; j++) {
          taskItems.add(buildTaskItem(
            "Exam",
            getTimeLeft(taskData[i]['exams'][j]['start_time']),
            taskData[i]['name'],
            taskData[i]['exams'][j]['exam_name'],
            getColorLeft(taskData[i]['exams'][j]['start_time']),
            false,
          ));

          exams.add(Homework(
            name: taskData[i]['exams'][j]['exam_name'],
            teacher: taskData[i]['teacher']['first_name'] +
                " " +
                taskData[i]['teacher']['last_name'],
            nameClass: taskData[i]['name'],
            dueDate: taskData[i]['exams'][j]['end_time'],
            time: "1 hour",
            imageUrl: getUrlImageClass(taskData[i]['type']),
          ));
        }
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigatorPage()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
        'Invalid email or password',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
      )),
    );
  }
}
