import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var auth = AuthService.get();
  RxBool isLoading = false.obs;

  void login(String email, String senha, BuildContext context) async {
    isLoading.value = true;
    await auth.login(email, senha, context);
    isLoading.value = false;
  }
}
