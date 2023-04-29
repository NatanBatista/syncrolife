import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/services/validation_service.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';
import 'package:syncrolife/widgets/custom_text_field.dart';

import '../../controllers/recovery_page_controller.dart';

final _formKey = GlobalKey<FormState>();

class RecoveryPage extends StatelessWidget {
  const RecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<RecoveryPageController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, //Cor da AppBar
        leading: IconButton(
          //Botão com o icone
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => (Navigator.pop(
              context)), //Função Navigator para voltar para pagina anterior
        ),
      ),
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(55),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      controller: _controller.emailController,
                      label: "Email",
                      fillColor: lavenderBlush,
                      keyboardtype: TextInputType.emailAddress,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'E-mail obrigatório';
                        } else if (!(ValidationService.isValidEmail(value))) {
                          return 'Formato de e-mail inválido';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButtonIcon(
                      // ElevatedButton customizado
                      buttonText: "Próximo", // Texto do botão
                      buttonColor: cornflowerBlue, // Background Color
                      textColor: lavenderBlush,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _controller.buttonEmail();
                        }
                      },
                      icone: const Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ))),
    );
  }
}
