import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class RegisterDoctorPageController extends GetxController {
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

  //Tela 3
  TextEditingController crmController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String specialityValue = '';

  //Chama o método de registerDoctor que está no AuthService
  void register(BuildContext context) async {
    isLoading.value = true;
    await auth.registerDoctor(
        emailController.text,
        passwordController.text,
        nameController.text,
        lastNameController.text,
        cpfController.text,
        crmController.text,
        phoneNumberController.text,
        specialityValue,
        context);
    isLoading.value = false;
  }
}
