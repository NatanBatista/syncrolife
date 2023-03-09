import 'package:flutter/material.dart';
import 'package:syncrolife/widgets/signup/signup_form_widget.dart';

class SignUp1PacientePage extends StatelessWidget {
  const SignUp1PacientePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFormPage(
      label1: 'Nome',
      label2: 'Sobrenome',
      label3: 'CPF',
      fillColor: Color(0xFFF0E6EF),
      rota: '/signupPaci2',
    );
  }
}
