import 'package:get/get.dart';

import '../models/appointment_model.dart';
import '../repositories/appointments_repository.dart';
import 'package:intl/intl.dart';

import '../services/auth_service.dart';

class SchedulePageController extends GetxController {
  final appointmentsRep = AppointmentsRepository.get();
  final auth = Get.find<AuthService>();
  RxList appointments = [].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    auth.isDoctor.value
        ? appointments.value =
            await appointmentsRep.getAppointmentsSchedule('idDoctor')
        : appointments.value =
            await appointmentsRep.getAppointmentsSchedule('idPatient');
  }
}
