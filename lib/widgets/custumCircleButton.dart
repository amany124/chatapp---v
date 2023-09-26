import 'package:flutter/material.dart';

class custumCircleButton extends StatelessWidget {
  VoidCallback? ontap;
  custumCircleButton({this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
            onPressed: ontap,
          ),
        ),
      ),
    );
  }
}
