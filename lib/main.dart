import 'package:flutter/material.dart';
import 'registration_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Регистрация',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        scaffoldBackgroundColor: Color(0xFFF5EDF7),
      ),
      home: RegistrationPage(),
    );
  }
}