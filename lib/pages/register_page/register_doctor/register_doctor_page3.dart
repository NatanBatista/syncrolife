import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

import '../../../controllers/register_doctor_page_controller.dart';

final _formKey = GlobalKey<FormState>();

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
            formKey: _formKey,
            label1: 'CRM',
            validate1: (value) {
              if (value == null || value.isEmpty) {
                return 'CRM obrigatório';
              }
            },
            controller1: controller.crmController,
            label2: 'Celular',
            type2: TextInputType.number,
            validate2: (value) {
              if (value == null || value.isEmpty) {
                return 'Número obrigatório';
              }
            },
            controller2: controller.phoneNumberController,
            label3: 'Especialidade',
            validate3: (value) {
              if (value == null || value.isEmpty) {
                return 'Especialidade obrigatório';
              }
            },
            controller3: controller.specialtyController,
            textButton: "Confirmar",
            fillColor: lavenderBlush,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.register(context);
              }
            },
          ),
        )
      ],
    );
  }
}
