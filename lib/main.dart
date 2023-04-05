import 'package:flutter/material.dart';
import 'package:syncrolife/config.dart';
import 'package:syncrolife/routes.dart';
import 'package:syncrolife/widgets/checkauth.dart';

void main() async {
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
      home: CheckAuth(),
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
