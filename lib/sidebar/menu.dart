import 'package:flutter/material.dart';
import 'package:flutter_timer/config/colors.dart';
import 'package:flutter_timer/services/timer_service.dart';
import 'package:provider/provider.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(text: 'My Profile', icon: Icons.account_circle_rounded),
        MenuItem(text: 'Account settings', icon: Icons.settings),
        MenuItem(text: 'Timesheet', icon: Icons.date_range),
        MenuItem(
          text: 'Logout',
          icon: Icons.logout,
          onTap: () {
            context.read<TimerService>().clearAllData();
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;

  const MenuItem({
    Key? key,
    required this.text,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Icon(
              icon,
              size: 30,
              color: AppColours.grey,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
