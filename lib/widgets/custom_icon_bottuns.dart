import 'package:chatapp/widgets/constant.dart';
import 'package:flutter/material.dart';

class custom_icon_bottuns extends StatelessWidget {
  String text;
  Color mainColor;
  Color textColor;
  VoidCallback? onpress;

  custom_icon_bottuns(
      {required this.text,
      required this.mainColor,
      required this.textColor,
      this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 264,
      decoration: BoxDecoration(
        color: mainColor,
        border: Border.all(color: kprimaryColor, width: 1.6),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 12,
            offset: Offset(2, 1), // changes the position of the shadow
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent,
        child: InkWell(
          onTap: onpress,
          splashColor: Color.fromARGB(57, 255, 255, 255),
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
