import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/screens/SignUpPage.dart';
import 'package:chatapp/screens/initialScreen.dart';
import 'package:chatapp/screens/login_page.dart';
import 'package:chatapp/screens/chatPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(chatapp());
}

class chatapp extends StatelessWidget {
  const chatapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        login_page.id: (context) => login_page(),
        initialScreen.id: (context) => initialScreen(),
        SignUpPage.id: (context) => SignUpPage(),
        chatPage.id: (context) => chatPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: initialScreen.id,
    );
  }
}
