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

  Future<AppointmentModel> getAppointmentFromId(String id) async {
    final docAppointmentId = await db.collection('appointments').doc(id);

    final snapshotId = await docAppointmentId.get();

    AppointmentModel appoint = AppointmentModel();

    appoint.fromJson(snapshotId.data()!);

    return appoint;
  }

  Future<List<AppointmentModel>> getAppointmentsFromStatus(
      String status) async {
    List<AppointmentModel> listAppointments = [];
    final docAppointmentsId = await db
        .collection('appointments')
        .where('idDoctor', isEqualTo: auth.auth.currentUser!.uid)
        .where('status', isEqualTo: status);

    final snapshotId = await docAppointmentsId.get();

    await snapshotId.docs.forEach(
      (element) async {
        AppointmentModel appointmentModel = AppointmentModel();
        appointmentModel.fromJson(element);
        listAppointments.add(appointmentModel);
      },
    );

    return listAppointments;
  }

  Future<List<AppointmentModel>> getAppointmentsSchedule(
      String whatUser) async {
    List<AppointmentModel> listAppointments = [];
    final docAppointmentsId = await db
        .collection('appointments')
        .where(whatUser, isEqualTo: auth.auth.currentUser!.uid)
        .where('status', whereIn: ['accepted', 'completed', 'canceled']);

    final snapshotId = await docAppointmentsId.get();

    await snapshotId.docs.forEach(
      (element) async {
        AppointmentModel appointmentModel = AppointmentModel();
        appointmentModel.fromJson(element);
        listAppointments.add(appointmentModel);
      },
    );
    return listAppointments;
  }

  Future<List<AppointmentModel>> getSentAppointments() async {
    return await getAppointmentsFromStatus('sent');
  }

  Future<List<AppointmentModel>> getAcceptedAppointments() async {
    return await getAppointmentsFromStatus('accepted');
  }

  Future<List<AppointmentModel>> getRejectedAppointments() async {
    return await getAppointmentsFromStatus('rejected');
  }

  Future<List<AppointmentModel>> getCompletedAppointments() async {
    return await getAppointmentsFromStatus('completed');
  }

  Future<List<AppointmentModel>> getCanceledAppointments() async {
    return await getAppointmentsFromStatus('canceled');
  }
}
