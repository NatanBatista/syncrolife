import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';
import 'package:syncrolife/widgets/custom_text_field.dart';

import '../../controllers/recovery_page_controller.dart';

final _formKey = GlobalKey<FormState>();

class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<RecoveryPageController>();

    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(55),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: 'Senha',
                    obsText: true,
                    fillColor: lavenderBlush,
                    controller: _controller.passwordController,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Senha obrigatória';
                      } else if (value.length < 8) {
                        return 'Sua senha deve ser maior que 8 carácteres';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'Repetir senha',
                    fillColor: lavenderBlush,
                    controller: _controller.repeatPasswordController,
                    obsText: true,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Senha obrigatória';
                      } else if (value.length < 8) {
                        return 'Sua senha deve ser maior que 8 carácteres';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonIcon(
                    buttonText: "Confirmar",
                    buttonColor: cornflowerBlue,
                    textColor: lavenderBlush,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/login');
                      }
                    },
                    icone: const Icon(Icons.login),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
