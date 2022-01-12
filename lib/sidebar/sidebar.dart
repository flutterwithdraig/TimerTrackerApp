import 'package:flutter/material.dart';

import 'header.dart';
import 'menu.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * .85,
        color: Colors.white,
        child: Column(
          children: [
            AppHeader(),
            AppMenu(),
          ],
        ),
      ),
    );
  }
}
