import 'package:flutter/material.dart';
import 'package:syncrolife/pages/feed_page/feed_page.dart';
import 'package:syncrolife/pages/initial/initial_page.dart';
import 'package:syncrolife/pages/login/login_page.dart';
import 'package:syncrolife/pages/splash_page.dart';
import 'package:syncrolife/pages/signup/signup_form1_paciente_page.dart';
import 'package:syncrolife/pages/signup/signup_form1_medico_page.dart';
import 'package:syncrolife/pages/signup/signup_form2_medico_page.dart';
import 'package:syncrolife/pages/signup/signup_form2_paciente_page.dart';
import 'package:syncrolife/pages/signup/signup_form3_medico_page.dart';
import 'package:syncrolife/pages/signup/signup_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor:
              const Color.fromARGB(255, 122, 135, 251)), // Cor primária
      initialRoute: '/splash',
      routes: {
        // Rotas
        '/splash': (_) => const SplashPage(),
        '/initial': (_) => const InitialPage(),
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignupPage(),
        '/signupMed1': (_) => const SignUp1MedicoPage(),
        '/signupPaci1': (_) => const SignUp1PacientePage(),
        '/signupMed2': (_) => const SignUp2MedicoPage(),
        '/signupPaci2': (_) => const SignUp2PacientePage(),
        '/signup3Med': (_) => const SignUp3MedPage(),
        '/feed': (_) => const FeedPage(),
      },
    );
  }
}
