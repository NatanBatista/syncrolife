import 'package:flutter/material.dart';
import 'package:syncrolife/style.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000))
        .then((_) => Navigator.of(context).pushReplacementNamed('/signup'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: cornflowerBlue,
        child: Center(child: Image.asset("assets/images/logo.png")),
      ),
    );
    ;
  }
}
