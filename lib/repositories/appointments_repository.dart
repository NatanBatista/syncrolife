import 'package:get/get.dart';
import 'package:syncrolife/services/auth_service.dart';

import '../models/appointment_model.dart';
import '../services/db_firestore_service.dart';

class AppointmentsRepository extends GetxController {
  RxList appointmentsSchedule = [].obs;
  final db = DBFirestore.get();
  final auth = Get.find<AuthService>();

  @override
  onInit() async {
    super.onInit();
    appointmentsSchedule.value = await getAppointmentsSchedule(
        auth.isDoctor.value ? 'idDoctor' : 'idPatient');
  }

  void updateRatingAppointment(String id, String newRating, String newCount) {
    db.collection('appointments').doc(id).update({
      'rating': newRating,
      'ratingCount': newCount,
    });
  }

  void updateStatusAppointment(String id, String status) {
    db.collection('appointments').doc(id).update({'status': status});
  }

  void updateNameAndTokenCall(String id, String name, String token) {
    db.collection('appointments').doc(id).update({
      'nameCall': name,
      'tokenCall': token,
    });
  }

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
        .where(whatUser, isEqualTo: auth.auth.currentUser?.uid)
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
