import 'package:chatapp/screens/SignUpPage.dart';
import 'package:chatapp/screens/login_page.dart';
import 'package:chatapp/widgets/constant.dart';
import 'package:chatapp/widgets/custom_icon_bottuns.dart';
import 'package:flutter/material.dart';

class initialScreen extends StatelessWidget {
  static String id = 'initialroutes';
  initialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Icon(
              Icons.textsms,
              size: 135,
              color: Colors.deepPurple[900],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Chatter',
              style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontFamily: 'Poppins',
                  fontSize: 29,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'World\'s most private chatting app'.toUpperCase(),
              style: TextStyle(
                color: const Color.fromARGB(255, 122, 80, 196),
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 155,
            ),
            custom_icon_bottuns(
              text: 'LOGIN',
              mainColor: Colors.white,
              textColor: kprimaryColor,
              onpress: () {
                Navigator.pushNamed(context, login_page.id);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            custom_icon_bottuns(
                onpress: () {
                  Navigator.pushNamed(context, SignUpPage.id);
                },
                text: 'SIGNUP',
                mainColor: kprimaryColor,
                textColor: Colors.white),
            const Spacer(
              flex: 2,
            ),
            Text(
              'Made with ❤️ by amany alzanfaly',
              style: TextStyle(
                color: Colors.black87,
                fontFamily: 'Poppins',
                fontSize: 14,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
