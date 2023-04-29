import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/recovery_page/recovery_password_page.dart';
import 'dart:math';

import '../pages/recovery_page/recovery_code_page.dart';
import '../services/auth_service.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

class RecoveryPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  late String code;

  final _auth = Get.find<AuthService>();

  Future<bool> isEmailRegistered(String email) async {
    try {
      final signInMethods = await _auth.auth.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      // tratamento de erro
      return false;
    }
  }

  String generateConfirmationCode() {
    final random = Random();
    final code = random.nextInt(999999);
    return code.toString().padLeft(6, '0');
  }

  void buttonEmail() async {
    if (await isEmailRegistered(emailController.text)) {
      Get.off(const RecoveryCodePage());

      sendCode();
    } else {
      Get.snackbar(
          'E-mail nao encontrado', 'Verifique o e-mail e tente novamente');
    }
  }

  void buttonCode() async {
    if (codeController.text == code) {
      Get.to(RecoveryPasswordPage());
    } else {
      Get.snackbar('Código incorreto', 'Verifique o código e tente novamente');
    }
  }

  void sendCode() async {
    //Gerando o código
    code = generateConfirmationCode();

    // Configuração do servidor SMTP do Gmail
    final smtpServer = gmail('syncrolifeapp@gmail.com', 'Lu98na16ry27wa42.');

    // Criação da mensagem de e-mail
    final message = Message()
      ..from = const Address('syncrolifeapp@gmail.com')
      ..recipients.add(emailController.text)
      ..subject = 'Código de confirmação'
      ..text = 'Seu código de confirmação é: $code';

    // Envio da mensagem de e-mail
    final sendReport = await send(message, smtpServer);

    print('E-mail enviado para $emailController.text: $sendReport');
  }
}
