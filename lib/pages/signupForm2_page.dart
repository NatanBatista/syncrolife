import 'package:flutter/material.dart';
import 'package:syncrolife/widgets/cTextFieldForm.dart';

import '../widgets/cElevatedButtonIcon.dart';

class SignUp2Page extends StatelessWidget {
  const SignUp2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.all(55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTextField(
              label: 'Email',
              fillColor: Color(0xFFF0E6EF),
            ),
            SizedBox(
              height: 15,
            ),
            const CustomTextField(
              label: 'Senha',
              fillColor: Color(0xFFF0E6EF),
              obsText: true,
            ),
            SizedBox(
              height: 15,
            ),
            const CustomTextField(
              label: 'Repetir Senha',
              fillColor: Color(0xFFF0E6EF),
              obsText: true,
            ),
            SizedBox(
              height: 15,
            ),
            CustomButtonIcon(
              // ElevatedButton customizado
              buttonText: 'Próximo', // Texto do botão
              buttonColor: Color(0xFF7A87FB), // Background Color
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              icone: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    ));
  }
}
