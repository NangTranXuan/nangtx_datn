import 'package:datn_test/constants/ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datn_test/constants/app_colors.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              //   height: 23.0,
              //   width: MediaQuery.of(context).size.width * 0.45,
              //   decoration: BoxDecoration(
              //       color: AppColors.kLGreyClr,
              //       borderRadius: BorderRadius.all(Radius.circular(5.5))),
              // ),
              // Listed(),
              // Listed(),
              // Listed(),
              // Listed(),
              // Listed(),
              MainText(txt: "No Result For Now!"),
            ],
          ),
        ),
      ),
    );
  }
}

class Listed extends StatelessWidget {
  const Listed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      height: 23.0,
      width: MediaQuery.of(context).size.width * 1,
      decoration: BoxDecoration(
          color: AppColors.kLGreyClr,
          borderRadius: BorderRadius.all(Radius.circular(5.5))),
    );
  }
}
