import 'package:get/get.dart';

import '../models/appointment_model.dart';
import '../repositories/appointments_repository.dart';

class SchedulePageController extends GetxController {
  final appointmentsRep = AppointmentsRepository.get();
  RxList appointments = [].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    appointments = await appointmentsRep.getAppointmentsSchedule();
    print(appointments.length);
  }
}
