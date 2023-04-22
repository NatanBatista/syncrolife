import 'package:get/get.dart';
import 'package:syncrolife/repositories/appointments_repository.dart';

import '../services/db_firestore_service.dart';

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
