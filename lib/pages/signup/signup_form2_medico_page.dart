import 'package:flutter/material.dart';
import 'package:syncrolife/widgets/signup/signup_form_widget.dart';

class SignUp2MedicoPage extends StatelessWidget {
  const SignUp2MedicoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFormPage(
      label1: 'Email',
      label2: 'Senha',
      label3: 'Repetir Senha',
      obsText2: true,
      obsText3: true,
      fillColor: Color(0xFFF0E6EF),
      rota: '/signup3Med',
    );
  }
}
