import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

import '../../../controllers/register_doctor_page_controller.dart';

class RegisterDoctorPage2 extends StatelessWidget {
  const RegisterDoctorPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterDoctorPageController());

    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomFormWidget(
            label1: 'Email',
            controller1: controller.emailController,
            label2: 'Senha',
            controller2: controller.passwordController,
            label3: 'Repetir Senha',
            controller3: controller.repeatPasswordController,
            textButton: "Proximo",
            obsText2: true,
            obsText3: true,
            fillColor: lavenderBlush,
            onPressed: () {
              Navigator.pushNamed(context, '/signup3Med');
            },
          ),
        )
      ],
    );
  }
}
