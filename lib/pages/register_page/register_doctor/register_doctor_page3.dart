import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

import '../../../controllers/register_doctor_page_controller.dart';

class RegisterDoctorPage3 extends StatelessWidget {
  RegisterDoctorPage3({super.key});
  final controller = Get.put(RegisterDoctorPageController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomFormWidget(
            label1: 'CRM',
            controller1: controller.crmController,
            label2: 'Celular',
            controller2: controller.phoneNumberController,
            label3: 'Especialidade',
            controller3: controller.specialtyController,
            textButton: "Confirmar",
            fillColor: lavenderBlush,
            onPressed: () {
              controller.register(context);
            },
          ),
        )
      ],
    );
  }
}
