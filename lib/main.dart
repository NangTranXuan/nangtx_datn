import 'package:datn_test/screens/login/login_screen.dart';
import 'package:datn_test/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/screens/calendar/calendar.dart';
import 'package:datn_test/screens/home/home.dart';

void main() {
  runApp(SchoolManagement());
}

class SchoolManagement extends StatefulWidget {
  @override
  _SchoolManagementState createState() => _SchoolManagementState();
}

class _SchoolManagementState extends State<SchoolManagement> {
  int _selectedItemIndex = 0;
  final List pages = [
    HomePage(),
    CalendarPage(),
    null,
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
