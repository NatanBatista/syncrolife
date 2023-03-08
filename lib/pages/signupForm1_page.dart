import 'package:flutter/material.dart';
import 'package:syncrolife/widgets/cTextFieldForm.dart';

import '../widgets/cElevatedButtonIcon.dart';

class SignUp1Page extends StatelessWidget {
  const SignUp1Page({super.key});

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
              label: 'Nome',
              fillColor: Color(0xFFF0E6EF),
            ),
            SizedBox(
              height: 15,
            ),
            const CustomTextField(
              label: 'Sobrenome',
              fillColor: Color(0xFFF0E6EF),
            ),
            SizedBox(
              height: 15,
            ),
            const CustomTextField(
              label: 'CPF',
              fillColor: Color(0xFFF0E6EF),
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
                Navigator.pushNamed(context, '/signup2');
              },
              icone: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    ));
  }
}
