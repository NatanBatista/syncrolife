import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/signup/widgets/signup_form_widget.dart';

class RegisterPatientPage2 extends StatelessWidget {
  const RegisterPatientPage2({super.key});

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
