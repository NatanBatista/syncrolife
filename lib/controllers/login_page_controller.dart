import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var auth = AuthService.to;
  RxBool isLoading = false.obs;

  void login(BuildContext context) async {
    isLoading.value = true;
    await auth.login(emailController.text, passwordController.text, context);
    isLoading.value = false;
  }
}
