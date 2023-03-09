import 'package:flutter/material.dart';
import 'package:syncrolife/style.dart';
import 'package:syncrolife/widgets/signup/signup_form_widget.dart';

class SignUp3MedPage extends StatelessWidget {
  const SignUp3MedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFormPage(
      label1: 'CRM',
      label2: 'Celular',
      label3: 'Especialidade',
      fillColor: lavenderBlush,
      rota: '/signup',
    );
  }
}
