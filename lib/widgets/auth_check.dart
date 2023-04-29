import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/layout_doctor.dart';
import 'package:syncrolife/widgets/splash_initial_widget.dart';

import '../layout_patient.dart';
import '../pages/initial_page/initial_page.dart';
import '../services/auth_service.dart';

class AuthCheck extends StatefulWidget {
  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthService.to.userIsAuthenticated.value
        ? (AuthService.to.isDoctor.value ? LayoutDoctor() : LayoutPatient())
        : InitialPage());
  }
}
