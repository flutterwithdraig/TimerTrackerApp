import 'package:flutter/material.dart';
import 'package:flutter_timer/config/colors.dart';

class HeaderTimer extends StatelessWidget {
  const HeaderTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColours.drkBlue,
        ),
        padding: const EdgeInsets.all(5),
        height: 80,
        width: double.infinity,
        child: Row(
          children: [
            PauseButton(),
            SizedBox(width: 10),
            Column(
              children: [
                Text('CLOCK STARTED AT 9:01 AM'),
                SizedBox(height: 5),
                Expanded(
                  child: Text(
                    '01:24:17',
                    style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w200,
                      height: 1,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PauseButton extends StatelessWidget {
  const PauseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColours.blue,
        ),
        child: Icon(
          Icons.pause,
          size: 40,
          color: Colors.white,
        ));
  }
}
