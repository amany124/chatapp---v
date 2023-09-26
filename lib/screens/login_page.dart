import 'package:chatapp/screens/SignUpPage.dart';
import 'package:chatapp/screens/chatPage.dart';
import 'package:chatapp/widgets/ShowEdgeAlertWidget.dart';
import 'package:chatapp/widgets/constant.dart';
import 'package:chatapp/widgets/customTextFeild.dart';
import 'package:chatapp/widgets/custom_icon_bottuns.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class login_page extends StatefulWidget {
  static String id = 'loginpage';

  login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  String? email;

  String? password;

  bool Isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Isloading,
      child: Form(
        key: formkey,
        child: Scaffold(
          backgroundColor: Color.fromARGB(249, 255, 255, 255),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 110,
                    ),
                    Icon(
                      Icons.textsms,
                      size: 135,
                      color: Colors.deepPurple[900],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Chatter',
                      style: TextStyle(
                          color: Colors.deepPurple[900],
                          fontFamily: 'Poppins',
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    customTextFeild(
                      onchanged: (data) {
                        email = data;
                      },
                      text: 'Email',
                      icon: Icons.email,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    customTextFeild(
                      onchanged: (data) {
                        password = data;
                      },
                      obscureText: true,
                      text: 'Password',
                      icon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    custom_icon_bottuns(
                        onpress: () async {
                          if (formkey.currentState!.validate()) {
                            setState(() {
                              Isloading = true;
                            });

                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email!, password: password!);
                              // showSnackbarWidget(context, ' Login successed');
                              // just to test the code but it is not important to use it
                              Navigator.pushNamed(context, chatPage.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackbarWidget(context, 'user not found');
                              } else if (e.code == 'wrong-password') {
                                showSnackbarWidget(context, 'wrong password');
                              }
                            }
                            setState(() {
                              Isloading = false;
                            });
                          }
                        },
                        text: 'LOGIN',
                        mainColor: kprimaryColor,
                        textColor: Colors.white),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignUpPage.id);
                      },
                      child: Text(
                        'or create an account',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontFamily: 'Poppins',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    //  EdgeAlertWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
