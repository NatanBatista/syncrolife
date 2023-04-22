import 'package:get/get.dart';
import 'package:syncrolife/repositories/appointments_repository.dart';

import '../services/db_firestore_service.dart';
import 'package:intl/intl.dart';

class AppointmentDashboardPageController extends GetxController {
  final appointmentsRep = AppointmentsRepository.get();
  final db = DBFirestore.get();

  RxList sentAppointments = [].obs;

  void setAppointments() async {
    sentAppointments.value =
        await appointmentsRep.getAppointmentsFromStatus('sent');
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    setAppointments();
  }

  String formattedDate(DateTime date) {
    String dataFormatada = DateFormat('dd/MM/yyyy').format(date);
    return dataFormatada;
  }

  String formattedWeekday(int dayNumber) {
    String dayText = '';
    switch (dayNumber) {
      case 1:
        dayText = 'Domingo';
        break;
      case 2:
        dayText = 'Segunda-feira';
        break;
      case 3:
        dayText = 'Terça-feira';
        break;
      case 4:
        dayText = 'Quarta-feira';
        break;
      case 5:
        dayText = 'Quinta-feira';
        break;
      case 6:
        dayText = 'Sexta-feira';
        break;
      case 7:
        dayText = 'Sábado';
        break;
    }
    return dayText;
  }

  void buttonAccepted(String idAppointment) async {
    db
        .collection('appointments')
        .doc(idAppointment)
        .update({'status': 'accepted'});
    setAppointments();
  }

  void buttonRejected(String idAppointment) async {
    db
        .collection('appointments')
        .doc(idAppointment)
        .update({'status': 'rejected'});
    setAppointments();
  }
}
