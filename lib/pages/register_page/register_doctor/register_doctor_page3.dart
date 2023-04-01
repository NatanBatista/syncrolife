import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/signup_form_widget.dart';

class RegisterDoctorPage3 extends StatelessWidget {
  const RegisterDoctorPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomFormPage(
      label1: 'CRM',
      label2: 'Celular',
      label3: 'Especialidade',
      textButton: "Confirmar",
      fillColor: lavenderBlush,
      rota: '/signup',
    );
  }
}
