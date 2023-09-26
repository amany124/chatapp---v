import 'package:flutter/material.dart';

void showSnackbarWidget(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: Colors.deepPurple[900],
      content: show_snackbar_content(
        message: message,
      ),
    ),
  );
}

class show_snackbar_content extends StatelessWidget {
  String? message;
  show_snackbar_content({required this.message});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
              size: 40,
            ),
          ],
        ),
        const SizedBox(
          width: 25,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              ' Uh Oh ! ',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              message!,
              style: TextStyle(
                color: const Color.fromARGB(219, 255, 255, 255),
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
