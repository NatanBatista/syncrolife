import 'package:flutter/material.dart';
import 'package:syncrolife/style.dart';
import 'package:syncrolife/widgets/signup/signup_form_widget.dart';

class SignUp2PacientePage extends StatelessWidget {
  const SignUp2PacientePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFormPage(
      label1: 'Email',
      label2: 'Senha',
      label3: 'Repetir Senha',
      textButton: "Confirmar",
      obsText2: true,
      obsText3: true,
      fillColor: lavenderBlush,
      rota: '/signup',
    );
  }
}
