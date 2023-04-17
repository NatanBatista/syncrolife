import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class RegisterPatientPageController extends GetxController {
  var auth = AuthService.to;
  RxBool isLoading = false.obs;

  //Tela 1
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();

  //Tela 2
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  void register(BuildContext context) async {
    isLoading.value = true;
    await auth.registerPatient(
        emailController.text,
        passwordController.text,
        nameController.text,
        lastNameController.text,
        cpfController.text,
        context);
    isLoading.value = false;
  }
}
