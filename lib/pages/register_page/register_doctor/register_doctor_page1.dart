import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/signup_form_widget.dart';

class RegisterDoctorPage1 extends StatelessWidget {
  const RegisterDoctorPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFormPage(
      label1: 'Nome',
      label2: 'Sobrenome',
      label3: 'CPF',
      textButton: "Proximo",
      fillColor: lavenderBlush,
      rota: '/signupMed2',
    );
  }
}
