import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/controllers/register_patient_page_controller.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

class RegisterPatientPage1 extends StatelessWidget {
  RegisterPatientPage1({super.key});
  final controller = Get.put(RegisterPatientPageController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomFormWidget(
            label1: 'Nome',
            controller1: controller.nameController,
            label2: 'Sobrenome',
            controller2: controller.lastNameController,
            label3: 'CPF',
            controller3: controller.cpfController,
            textButton: "Proximo",
            fillColor: lavenderBlush,
            onPressed: () {
              Navigator.pushNamed(context, '/signupPaci2');
            },
          ),
        ),
      ],
    );
  }
}
