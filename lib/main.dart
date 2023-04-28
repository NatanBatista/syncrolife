import 'package:flutter/material.dart';
import 'package:syncrolife/config.dart';
import 'package:syncrolife/pages/make_appointment_page/make_appointment_page.dart';
import 'package:syncrolife/pages/register_page/register_doctor/register_doctor_page1.dart';
import 'package:syncrolife/pages/register_page/register_doctor/register_doctor_page2.dart';
import 'package:syncrolife/pages/register_page/register_doctor/register_doctor_page3.dart';
import 'package:syncrolife/pages/register_page/widgets/specialities_dropdownbutton.dart';
import 'package:syncrolife/pages/splash_page.dart';
import 'package:syncrolife/routes.dart';
import 'package:syncrolife/widgets/auth_check.dart';

void main() async {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
  await initConfigurations();
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
      home: AuthCheck(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
