import 'package:datn_test/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class LeaveApply extends StatelessWidget {
  LeaveApply({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: 20.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainText(txt: "Function not yet supported!"),
        ],
      ),
    ));
  }
}
