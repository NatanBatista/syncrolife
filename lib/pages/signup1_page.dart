import 'package:flutter/material.dart';

class SignUp1Page extends StatelessWidget {
  const SignUp1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.all(55),
        child: TextField(
          decoration: const InputDecoration(label: Text("Nome")),
        ),
      ),
    ));
  }
}
