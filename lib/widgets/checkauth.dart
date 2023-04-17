import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/layout_doctor.dart';

import '../layout_patient.dart';
import '../pages/initial_page/initial_page.dart';
import '../services/auth_service.dart';

class CheckAuth extends StatefulWidget {
  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthService.to.userIsAuthenticated.value
        ? (AuthService.to.isDoctor.value ? LayoutDoctor() : LayoutPatient())
        : InitialPage());
  }
}
