import 'package:flutter/material.dart';

const urlBase = 'http://127.0.0.1:8000/api';
const urlLogin = '$urlBase/login'; // api login
const urlUser = '$urlBase/user'; // api get user
const urlLogout = '$urlBase/user/logout'; // api logout
const urlLesson = '$urlBase/user/lesson'; // api post lesson
const urlLessonSelectedDate = '$urlBase/user/lesson_schedule_task'; // api post lesson
const urlTask = '$urlBase/user/task'; // api get
