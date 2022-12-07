import 'package:flutter/material.dart';
import 'package:register_login/screens/login/login_screen.dart';
import 'package:register_login/screens/login/pilihan_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PilihanLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
