import 'package:flutter/material.dart';
import 'package:syncrolife/pages/feed_page/feed_page.dart';
import 'package:syncrolife/pages/initial/initial_page.dart';
import 'package:syncrolife/pages/login/login_page.dart';
import 'package:syncrolife/pages/recovery_page/recovery_code_page.dart';
import 'package:syncrolife/pages/recovery_page/recovery_page.dart';
import 'package:syncrolife/pages/recovery_page/recovery_password_page.dart';
import 'package:syncrolife/pages/signup/signup_medico1_page.dart';
import 'package:syncrolife/pages/signup/signup_medico2_page.dart';
import 'package:syncrolife/pages/signup/signup_medico3_page.dart';
import 'package:syncrolife/pages/signup/signup_paciente1_page.dart';
import 'package:syncrolife/pages/signup/signup_paciente2_page.dart';
import 'package:syncrolife/pages/signup/signup_page.dart';
import 'package:syncrolife/pages/splash_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/splash': (_) => const SplashPage(),
  '/initial': (_) => const InitialPage(),
  '/login': (_) => const LoginPage(),
  '/recovery': (_) => const RecoveryPage(),
  '/recoverycode': (_) => const RecoveryCodePage(),
  '/recoverypw': (_) => const RecoveryPasswordPage(),
  '/signup': (_) => const SignupPage(),
  '/signupMed1': (_) => const SignUp1MedicoPage(),
  '/signupPaci1': (_) => const SignUp1PacientePage(),
  '/signupMed2': (_) => const SignUp2MedicoPage(),
  '/signupPaci2': (_) => const SignUp2PacientePage(),
  '/signup3Med': (_) => const SignUp3MedPage(),
  '/feed': (_) => const FeedPage(),
};
