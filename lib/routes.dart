import 'package:flutter/material.dart';
import 'package:syncrolife/layout_doctor.dart';
import 'package:syncrolife/layout_patient.dart';
import 'package:syncrolife/pages/feed_page/feed_page.dart';
import 'package:syncrolife/pages/initial_page/initial_page.dart';
import 'package:syncrolife/pages/login_page/login_page.dart';
import 'package:syncrolife/pages/make_appointment/make_appointment.dart';
import 'package:syncrolife/pages/recovery_page/recovery_code_page.dart';
import 'package:syncrolife/pages/recovery_page/recovery_page.dart';
import 'package:syncrolife/pages/recovery_page/recovery_password_page.dart';
import 'package:syncrolife/pages/register_page/register_doctor/register_doctor_page1.dart';
import 'package:syncrolife/pages/register_page/register_doctor/register_doctor_page2.dart';
import 'package:syncrolife/pages/register_page/register_doctor/register_doctor_page3.dart';
import 'package:syncrolife/pages/register_page/register_patient/register_patient_page1.dart';
import 'package:syncrolife/pages/register_page/register_patient/register_patient_page2.dart';
import 'package:syncrolife/pages/register_page/register_options_page.dart';
import 'package:syncrolife/pages/splash_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/splash': (_) => const SplashPage(),
  '/initial': (_) => const InitialPage(),
  '/login': (_) => const LoginPage(),
  '/recovery': (_) => const RecoveryPage(),
  '/recoverycode': (_) => const RecoveryCodePage(),
  '/recoverypw': (_) => const RecoveryPasswordPage(),
  '/signup': (_) => const RegisterOptionsPage(),
  '/signupMed1': (_) => const RegisterDoctorPage1(),
  '/signupPaci1': (_) => RegisterPatientPage1(),
  '/signupMed2': (_) => const RegisterDoctorPage2(),
  '/signupPaci2': (_) => RegisterPatientPage2(),
  '/signup3Med': (_) => RegisterDoctorPage3(),
  '/layoutPatient': (_) => const LayoutPatient(),
  '/layoutDoctor': (_) => const LayoutDoctor(),
};
