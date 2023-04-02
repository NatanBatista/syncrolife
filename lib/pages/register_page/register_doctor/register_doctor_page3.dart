import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/signup_form_widget.dart';

import '../../../controllers/register_doctor_page_controller.dart';

class RegisterDoctorPage3 extends StatelessWidget {
  const RegisterDoctorPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterDoctorPageController());

    return CustomFormPage(
      label1: 'CRM',
      controller1: controller.crmController,
      label2: 'Celular',
      controller2: controller.phoneNumberController,
      label3: 'Especialidade',
      controller3: controller.specialtyController,
      textButton: "Confirmar",
      fillColor: lavenderBlush,
      rota: '/signup',
    );
  }
}
