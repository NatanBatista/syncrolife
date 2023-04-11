import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/signup_form_widget.dart';

import '../../../controllers/register_doctor_page_controller.dart';

class RegisterDoctorPage1 extends StatelessWidget {
  const RegisterDoctorPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterDoctorPageController());

    return CustomFormPage(
      label1: 'Nome',
      controller1: controller.nameController,
      label2: 'Sobrenome',
      controller2: controller.lastNameController,
      label3: 'CPF',
      controller3: controller.cpfController,
      textButton: "Proximo",
      fillColor: lavenderBlush,
      rota: '/signupMed2',
    );
  }
}
