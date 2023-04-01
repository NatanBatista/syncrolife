import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/signup_form_widget.dart';

class RegisterPatientPage1 extends StatelessWidget {
  const RegisterPatientPage1({super.key});

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
