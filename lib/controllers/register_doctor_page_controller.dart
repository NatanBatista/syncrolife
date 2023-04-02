import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterDoctorPageController extends GetxController {
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
  TextEditingController specialtyController = TextEditingController();
}
