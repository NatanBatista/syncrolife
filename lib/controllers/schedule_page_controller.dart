import 'package:get/get.dart';

import '../models/appointment_model.dart';
import '../repositories/appointments_repository.dart';
import 'package:intl/intl.dart';

class SchedulePageController extends GetxController {
  final appointmentsRep = AppointmentsRepository.get();
  RxList appointments = [].obs;

  String formattedDate(DateTime date) {
    String dataFormatada = DateFormat('dd/MM/yyyy').format(date);
    return dataFormatada;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    appointments.value = await appointmentsRep.getAppointmentsSchedule();
  }
}
