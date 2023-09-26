import 'package:chatapp/widgets/constant.dart';
import 'package:chatapp/widgets/custumCircleButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class custom_message_textfeild extends StatelessWidget {
  custom_message_textfeild(
      {this.onsubmitted,
      this.textcontroller,
      this.Scroll_controller,
      this.email});
  // TextEditingController controller = TextEditingController();
  Function(String)? onsubmitted;
  TextEditingController? textcontroller;
  ScrollController? Scroll_controller;
  Object? email;
  static String textFeildDataCopy = '';
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              width: 290,
              height: 58,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 1,
                    offset: Offset(3, 4), // changes the position of the shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: TextField(
                  controller: textcontroller,
                  onChanged: (data) {
                    textFeildDataCopy = data;
                  },
                  onSubmitted: onsubmitted,
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    hintText: 'Type your message here ...',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        custumCircleButton(
          ontap: () {
            if (textFeildDataCopy != '') {
              messages.add({
                'id': email,
                'message content': textFeildDataCopy,
                kcreatedAt: DateTime.now(),
              });
              textcontroller!.clear();
              Scroll_controller!.animateTo(0,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              textFeildDataCopy = '';
            } else {
              Scroll_controller!.animateTo(0,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }
          },
        ),
      ],
    );
  }
}
