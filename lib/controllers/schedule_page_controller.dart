import 'package:get/get.dart';

import '../models/appointment_model.dart';
import '../repositories/appointments_repository.dart';
import 'package:intl/intl.dart';

import '../services/auth_service.dart';

class SchedulePageController extends GetxController {
  final auth = Get.find<AuthService>();

  final appointmentsRep = Get.find<AppointmentsRepository>();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
}
