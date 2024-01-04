import 'package:datn_test/screens/login/screens.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:datn_test/constants/constants.dart';

class ProfileListItem extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  _ProfileListItemState createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.hasNavigation) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
      child: Container(
        height: kSpacingUnit * 5,
        margin: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 6,
        ).copyWith(
          bottom: kSpacingUnit * 2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingUnit * 3),
          color: Color.fromARGB(255, 225, 225, 240),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              size: kSpacingUnit * 1.5,
            ),
            SizedBox(width: kSpacingUnit * 1.5),
            Text(
              widget.text,
              style: kTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            if (widget.hasNavigation)
              Icon(
                LineAwesomeIcons.angle_right,
                size: kSpacingUnit * 1.5,
              ),
          ],
        ),
      ),
    );
  }
}
