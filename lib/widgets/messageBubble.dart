import 'package:chatapp/models/MessageModel.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageModel? message;
  MessageBubble({this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: Colors.blue,
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  message!.message_content,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubbleforFreind extends StatelessWidget {
  MessageModel? message;
  MessageBubbleforFreind({this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(0),
                topRight: Radius.circular(50),
              ),
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  message!.message_content,
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Poppins',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
