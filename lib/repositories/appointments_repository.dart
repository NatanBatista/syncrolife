import 'package:get/get.dart';
import 'package:syncrolife/services/auth_service.dart';

import '../models/appointment_model.dart';
import '../services/db_firestore_service.dart';

class AppointmentsRepository {
  AppointmentsRepository._();

  static final _instance = AppointmentsRepository._();

  static get() {
    return _instance;
  }

  final db = DBFirestore.get();
  final auth = Get.find<AuthService>();

  Future<List<AppointmentModel>> getAppointmentsFromStatus(
      String status) async {
    List<AppointmentModel> listAppointments = [];
    final docAppointmentsId = db
        .collection('users')
        .doc(auth.auth.currentUser!.uid)
        .collection('appointments');

    final snapshotId = await docAppointmentsId.get();

    snapshotId.docs.forEach(
      (idAppointment) async {
        String id = idAppointment['id'];

        final docAppointmentsSent = db
            .collection('appointments')
            .where('id', isEqualTo: id)
            .where('status', isEqualTo: status);

        final snapshotSent = await docAppointmentsSent.get();

        snapshotSent.docs.forEach((element) {
          AppointmentModel appointmentModel = AppointmentModel();
          appointmentModel.fromJson(element);
          listAppointments.add(appointmentModel);
        });
      },
    );
    return listAppointments;
  }
}
