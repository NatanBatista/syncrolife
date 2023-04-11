import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/services/validation_service.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';
import 'package:syncrolife/widgets/custom_text_field.dart';

import '../../controllers/login_page_controller.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () => (Navigator.pop(context)),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ))),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(55),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: 'E-mail',
                    fillColor: lavenderBlush,
                    keyboardtype: TextInputType.emailAddress,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-mail obrigatório';
                      } else if (!(ValidationService.isValidEmail(value))) {
                        return 'Formato de e-mail inválido';
                      }
                    },
                    controller: _.emailController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    label: 'Senha',
                    fillColor: lavenderBlush,
                    obsText: true,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Senha obrigatória';
                      }
                    },
                    controller: _.passwordController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonIcon(
                    buttonText: "Entrar",
                    buttonColor: cornflowerBlue,
                    textColor: lavenderBlush,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _.login(context);
                      }
                    },
                    icone: const Icon(Icons.login),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/recovery'),
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: cornflowerBlue),
                    ),
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
