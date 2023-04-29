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
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  late String code;

  final List<TextEditingController> controllersCode = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodesCode = List.generate(
    6,
    (index) => FocusNode(),
  );

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
      await _auth.auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar(
          'Sucesso!', 'Link de alteração da senha enviado para o seu e-mail.',
          icon: Icon(
            Icons.verified,
            color: Colors.green,
          ),
          duration: Duration(seconds: 4));
      // Get.off(const RecoveryCodePage());

      // sendCode();
    } else {
      Get.snackbar(
          'E-mail não encontrado', 'Verifique o e-mail e tente novamente');
    }
  }

  void buttonCode() async {
    String digitedCode = '';
    controllersCode.forEach((element) {
      digitedCode + element.text;
    });
    if (digitedCode == code) {
      Get.to(RecoveryPasswordPage());
    } else {
      Get.snackbar('Código incorreto', 'Verifique o código e tente novamente');
    }
  }

  void buttonChangePassword() async {}

  void sendCode() async {
    //Gerando o código
    code = generateConfirmationCode();

    // Configuração do servidor SMTP do Gmail
    final smtpServer = gmail('syncrolifeapp@gmail.com', 'lmfessakfuizmkqs');

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

  void onTextChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      focusNodesCode[index + 1].requestFocus();
    }
  }
}
