import 'package:chatapp/widgets/ShowEdgeAlertWidget.dart';
import 'package:flutter/material.dart';

class customTextFeild extends StatelessWidget {
  String text;
  IconData icon;
  Function(String)? onchanged;
  bool obscureText;

  customTextFeild({
    required this.text,
    required this.icon,
    required this.onchanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 70,
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          }
        },
        onChanged: onchanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 20,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.deepPurple,
            size: 26,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
