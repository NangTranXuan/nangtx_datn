import 'dart:convert';
import 'package:datn_test/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:datn_test/constants/route.dart';

Future getLesson() async {
  var lessonData;
  var response = await http.post(
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
  lessonData = jsonDecode(response.body);
  return lessonData;
}
