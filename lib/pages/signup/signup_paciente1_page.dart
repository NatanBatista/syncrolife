import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/signup/widgets/signup_form_widget.dart';

class SignUp1PacientePage extends StatelessWidget {
  const SignUp1PacientePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFormPage(
      label1: 'Nome',
      label2: 'Sobrenome',
      label3: 'CPF',
      textButton: "Proximo",
      fillColor: lavenderBlush,
      rota: '/signupPaci2',
    );
  }
}
