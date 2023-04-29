import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/config.dart';
import 'package:syncrolife/pages/recovery_page/recovery_code_page.dart';
import 'package:syncrolife/pages/recovery_page/recovery_page.dart';
import 'package:syncrolife/pages/recovery_page/recovery_password_page.dart';

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
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor:
              const Color.fromARGB(255, 122, 135, 251)), // Cor primária
      home: const RecoveryPage(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
