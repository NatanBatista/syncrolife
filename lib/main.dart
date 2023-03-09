import 'package:flutter/material.dart';
import 'package:syncrolife/pages/splash_page.dart';
import 'package:syncrolife/pages/signup/signup_form1_paciente_page.dart';
import 'package:syncrolife/pages/signup/signup_form1_medico_page.dart';
import 'package:syncrolife/pages/signup/signup_form2_medico_page.dart';
import 'package:syncrolife/pages/signup/signup_form2_paciente_page.dart';
import 'package:syncrolife/pages/signup/signup_form_medico_page.dart';
import 'package:syncrolife/pages/signup/signup_form_page.dart';

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
        '/signupMed1': (_) => const SignUp1MedicoPage(),
        '/signupPaci1': (_) => const SignUp1PacientePage(),
        '/signupMed2': (_) => const SignUp2MedicoPage(),
        '/signupPaci2': (_) => const SignUp2PacientePage(),
        '/signup3Med': (_) => const SignUp3MedPage(),
      },
    );
  }
}
