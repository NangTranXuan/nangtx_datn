import 'package:datn_test/globals.dart';
import 'package:datn_test/model/homework.dart';
import 'package:datn_test/widgets/homework_item.dart';
import 'package:flutter/material.dart';

class YourHomework extends StatelessWidget {
  YourHomework({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Homeworks'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: homeworks.length,
        itemBuilder: (context, index) {
          return HomeworkListItem(hwInfo: homeworks[index]);
        },
      ),
    );
  }
}
