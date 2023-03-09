import 'package:flutter/material.dart';
import 'package:syncrolife/style.dart';
import 'package:syncrolife/widgets/signup/signup_form_widget.dart';

class SignUp1MedicoPage extends StatelessWidget {
  const SignUp1MedicoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFormPage(
      label1: 'Nome',
      label2: 'Sobrenome',
      label3: 'CPF',
      fillColor: lavenderBlush,
      rota: '/signupMed2',
    );
  }
}
