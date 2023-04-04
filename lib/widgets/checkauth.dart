import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../layout.dart';
import '../pages/initial_page/initial_page.dart';
import '../services/auth_service.dart';

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        AuthService.to.userIsAuthenticated.value ? Layout() : InitialPage());
  }
}
