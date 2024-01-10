import 'package:flutter/material.dart';

Container buildTaskItem(int numDays, String courseTitle, Color color) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    padding: EdgeInsets.all(12),
    height: 140,
    width: 140,
    decoration: BoxDecoration(
      color: color.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Deadline",
          style: TextStyle(fontSize: 10, color: Colors.grey),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "$numDays days left",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 100,
          child: Text(
            courseTitle,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Row buildTitleRow(String title, int number) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      RichText(
        text: TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: " ($number)",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal),
              ),
            ]),
      ),
    ],
  );
}
