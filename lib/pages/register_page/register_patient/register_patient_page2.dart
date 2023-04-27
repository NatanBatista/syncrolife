import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/services/validation_service.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

import '../../../controllers/register_patient_page_controller.dart';

final _formKey = GlobalKey<FormState>();

class RegisterPatientPage2 extends StatelessWidget {
  RegisterPatientPage2({super.key});
  final controller = Get.put(RegisterPatientPageController());

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CustomFormWidget(
          formKey: _formKey,
          isPage3: false,
          label1: 'Email',
          type1: TextInputType.emailAddress,
          validate1: (value) {
            if (value == null || value.isEmpty) {
              return 'E-mail obrigatório';
            } else if (!(ValidationService.isValidEmail(value))) {
              return 'Formato de e-mail inválido';
            }
          },
          controller1: controller.emailController,
          label2: 'Senha',
          validate2: (value) {
            if (value == null || value.isEmpty) {
              return 'Senha obrigatória';
            } else if (value.length < 8) {
              return 'Sua senha deve ser no mínimo 8 caracteres';
            }
          },
          controller2: controller.passwordController,
          label3: 'Repetir Senha',
          validate3: (value) {
            if (value == null || value.isEmpty) {
              return 'Senha obrigatória';
            } else if (value.length < 8) {
              return 'Sua senha deve ser no mínimo 8 caracteres';
            }
          },
          controller3: controller.repeatPasswordController,
          textButton: "Confirmar",
          obsText2: true,
          obsText3: true,
          fillColor: lavenderBlush,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // A validação passou, pode prosseguir
              controller.register(context);
            }
          },
        ),
      ),
    ]);
  }
}
