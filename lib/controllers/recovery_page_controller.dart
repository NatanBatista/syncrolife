import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/login_page/login_page.dart';

import '../services/auth_service.dart';

class RecoveryPageController extends GetxController {
  TextEditingController emailController = TextEditingController();

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

  void buttonEmail() async {
    if (await isEmailRegistered(emailController.text)) {
      await _auth.auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar(
          'Sucesso!', 'Link de alteração da senha enviado para o seu e-mail.',
          icon: const Icon(
            Icons.verified,
            color: Colors.green,
          ),
          duration: const Duration(seconds: 4));
      Get.back();
    } else {
      Get.snackbar(
          'E-mail não encontrado', 'Verifique o e-mail e tente novamente');
    }
  }
}
