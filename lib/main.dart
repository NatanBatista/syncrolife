import 'package:flutter/material.dart';
import 'package:syncrolife/pages/signup1_page.dart';
import 'package:syncrolife/pages/signup_page.dart';
import 'package:syncrolife/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 122, 135, 251)), // Cor primária
      initialRoute: '/splash',
      routes: {
        // Rotas
        '/splash': (_) => const SplashPage(),
        '/signup': (_) => const SignupPage(),
        '/signup1': (_) => const SignUp1Page(),
      },
    );
  }
}
