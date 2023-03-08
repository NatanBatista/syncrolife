import 'package:flutter/material.dart';
import 'package:syncrolife/widgets/cTextFieldForm.dart';

import '../widgets/cElevatedButtonIcon.dart';

class SignUp3MedPage extends StatelessWidget {
  const SignUp3MedPage({super.key});

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
              label: 'CRM',
              fillColor: Color(0xFFF0E6EF),
            ),
            SizedBox(
              height: 15,
            ),
            const CustomTextField(
              label: 'Celular',
              fillColor: Color(0xFFF0E6EF),
              obsText: true,
            ),
            SizedBox(
              height: 15,
            ),
            const CustomTextField(
              label: 'Especialidade',
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
