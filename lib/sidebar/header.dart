import 'package:flutter/material.dart';
import 'package:flutter_timer/config/colors.dart';
import 'package:flutter_timer/sidebar/profile.dart';
import 'package:flutter_timer/sidebar/timer.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(color: Colors.white),
      child: Container(
        color: AppColours.blue,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Profile(),
            HeaderTimer(),
          ],
        ),
      ),
    );
  }
}
