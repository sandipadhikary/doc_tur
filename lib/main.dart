import 'package:flutter/material.dart';

import 'login_page.dart';
import 'otp_page.dart';
import 'registration_page.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'doc_tur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/otp': (context) => OtpPage(
            verificationId:
                ModalRoute.of(context)!.settings.arguments as String),
        '/register': (context) => RegistrationPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
