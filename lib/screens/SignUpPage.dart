import 'package:chatapp/screens/chatPage.dart';
import 'package:chatapp/widgets/ShowEdgeAlertWidget.dart';
import 'package:chatapp/widgets/constant.dart';
import 'package:chatapp/widgets/customTextFeild.dart';
import 'package:chatapp/widgets/custom_icon_bottuns.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  static String id = 'signup';

  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                        icon: Icons.email),
                    const SizedBox(
                      height: 25,
                    ),
                    customTextFeild(
                        onchanged: (data) {
                          password = data;
                         
                        },
                        obscureText: true,
                        text: 'Password',
                        icon: Icons.lock),
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
                              await SignUpUser();
                              // showSnackbarWidget(context,
                              //     'The account has created successfuly'); // just to test the code but it is not important to use it
                              Navigator.pushNamed(context, chatPage.id,
                                  arguments: email);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackbarWidget(context, 'weak password');
                              } else if (e.code == 'email-already-in-use') {
                                showSnackbarWidget(
                                    context, 'The account already exists');
                              }
                            } catch (e) {
                              showSnackbarWidget(
                                  context, 'There was an error ');
                              print(e);
                            }
                            setState(() {
                              Isloading = false;
                            });
                          }
                        },
                        text: 'SIGNUP',
                        mainColor: kprimaryColor,
                        textColor: Colors.white),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'aready have an account',
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

  Future<void> SignUpUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
