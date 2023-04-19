import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/services/validation_service.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

import '../../../controllers/register_doctor_page_controller.dart';

final _formKey = GlobalKey<FormState>();

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
            formKey: _formKey,
            label1: 'Email',
            controller1: controller.emailController,
            type1: TextInputType.emailAddress,
            validate1: (value) {
              if (value == null || value.isEmpty) {
                return 'E-mail obrigatório';
              } else if (!(ValidationService.isValidEmail(value))) {
                //Testa se é um E-mail válido.
                //Se o retorno for true, o E-mail é valido e não deve cair nesse if, por isso está negado ~isValidEmail
                return 'Formato de e-mail inválido';
              }
            },
            label2: 'Senha',
            controller2: controller.passwordController,
            validate2: (value) {
              if (value == null || value.isEmpty) {
                return 'Senha obrigatória';
              } else if (value.length < 8) {
                // Senha deve conter 8 ou mais carácteres
                return 'Sua senha deve ser no mínimo 8 caracteres';
              }
            },
            label3: 'Repetir Senha',
            validate3: (value) {
              if (value == null || value.isEmpty) {
                return 'Senha obrigatório';
              } else if (value.length < 8) {
                return 'Sua senha deve ser no mínimo 8 caracteres';
              }
            },
            controller3: controller.repeatPasswordController,
            textButton: "Proximo",
            obsText2: true,
            obsText3: true,
            fillColor: lavenderBlush,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, '/signup3Med');
              }
            },
          ),
        )
      ],
    );
  }
}
