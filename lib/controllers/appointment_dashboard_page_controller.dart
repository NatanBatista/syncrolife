import 'package:get/get.dart';
import 'package:syncrolife/repositories/appointments_repository.dart';

import '../services/db_firestore_service.dart';
import 'package:intl/intl.dart';

class AppointmentDashboardPageController extends GetxController {
  final appointmentsRep = AppointmentsRepository.get();
  final db = DBFirestore.get();

  RxList sentAppointments = [].obs;
  RxList acceptedAppointments = [].obs;
  RxList rejectedAppointments = [].obs;
  RxList completedAppointments = [].obs;
  RxList canceledAppointments = [].obs;

  //A consulta terá 5 status -> sent (enviada) | accepted (aceita) | rejected (rejeitada) | completed (concluída) | canceled (cancelada)
  //Se o paciente não entrar ela contará como "completed", mas se o médico não entrar ela contará como "canceled"
  void setSentAppointments() async {
    sentAppointments.value =
        await appointmentsRep.getAppointmentsFromStatus('sent');
  }

  void setAcceptedAppointments() async {
    acceptedAppointments.value =
        await appointmentsRep.getAppointmentsFromStatus('accepted');
  }

  void setRejectedAppointments() async {
    rejectedAppointments.value =
        await appointmentsRep.getAppointmentsFromStatus('rejected');
  }

  void setCompletedAppointments() async {
    completedAppointments.value =
        await appointmentsRep.getAppointmentsFromStatus('completed');
  }

  void setCanceledAppointments() async {
    canceledAppointments.value =
        await appointmentsRep.getAppointmentsFromStatus('canceled');
  }

  double totalBilled() {
    double total = 0;
    completedAppointments.forEach((element) {
      total = total + element.value.value;
    });
    return total;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    sentAppointments.value = await appointmentsRep.getSentAppointments();
    acceptedAppointments.value =
        await appointmentsRep.getAcceptedAppointments();
    rejectedAppointments.value =
        await appointmentsRep.getRejectedAppointments();
    completedAppointments.value =
        await appointmentsRep.getCompletedAppointments();
    canceledAppointments.value =
        await appointmentsRep.getCanceledAppointments();
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
    setSentAppointments();
  }

  void buttonRejected(String idAppointment) async {
    db
        .collection('appointments')
        .doc(idAppointment)
        .update({'status': 'rejected'});
    setSentAppointments();
  }
}
