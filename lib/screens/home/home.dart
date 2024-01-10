import 'dart:convert';
import 'package:datn_test/constants/app_colors.dart';
import 'package:datn_test/constants/constants.dart';
import 'package:datn_test/constants/time.dart';
import 'package:datn_test/screens/home/home_api.dart';
import 'package:datn_test/screens/home_screen_item/FUNCTIONS.dart';
import 'package:datn_test/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var lessonData;
  void initState() {
    super.initState();
    Future.microtask(() {
      lessonData = getLesson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              //color: Color(0xFFD4E7FE),
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
                buildTitleRow("YOUR CLASSES", 3),
                SizedBox(
                  height: 20,
                ),
                // Column(
                //   children: classList,
                // ),
                SizedBox(
                  height: 20,
                ),
                buildTitleRow("YOUR TASKS", 3),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildTaskItem(
                          3, "The Basic of Typography II", Colors.red),
                      buildTaskItem(3, "Design Psychology: Principle of...",
                          Colors.green),
                      buildTaskItem(3, "Design Psychology: Principle of...",
                          Colors.green),
                      buildTaskItem(3, "Design Psychology: Principle of...",
                          Colors.green),
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

  Container buildClassItem(String time, bool isAM, String className,
      String roomName, String teacherName) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9FB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "07:00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "AM",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 160,
                child: Text(
                  "The Basic of Typography II",
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 160,
                    child: Text(
                      "Room C1, Faculty of Art & Design Building",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage("assets/icons/avatar.png"),
                    radius: 10,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Gabriel Sutton",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  // List<Container> getClassItems() {
  //   List<Container> items = [];
  //   for (int i = 0; i < lessonData.length; i++) {
  //     for (var j = 0; j < lessonData[i]['lessons'].length; j++) {
  //       items.add(buildClassItem(
  //           DateTime.parse(lessonData[i]['lessons'][j]['start_time'])
  //                   .hour
  //                   .toString() +
  //               ":" +
  //               DateTime.parse(lessonData[i]['lessons'][j]['start_time'])
  //                   .minute
  //                   .toString(),
  //           DateTime.parse(lessonData[i]['lessons'][j]['start_time']).hour < 12,
  //           lessonData[i]['name'],
  //           lessonData[i]['room']['name'] + address,
  //           lessonData[i]['teacher']['first_name'] +
  //               " " +
  //               lessonData[i]['teacher']['last_name']));
  //     }
  //   }
  //   return items;
  // }
}
