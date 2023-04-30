import 'package:get/get.dart';
import 'package:syncrolife/models/doctor_model.dart';
import 'package:syncrolife/services/db_firestore_service.dart';

class DoctorsRepository extends GetxController {
  final db = DBFirestore.get();
  RxList allDoctors = [].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    updateAllDoctors();
  }

  void updateAllDoctors() async {
    allDoctors.value = await getAllDoctors();
  }

  void updateRatingDoctor(String id, String newRating, String newCount) async {
    await db.collection('users').doc(id).update({
      'rating': newRating,
      'ratingsCount': newCount,
    });
    updateAllDoctors();
  }

  Future<DoctorModel> getDoctorFromId(String id) async {
    final docDoctorId = await db.collection('users').doc(id);

    final snapshotId = await docDoctorId.get();

    DoctorModel doctor = DoctorModel();

    doctor.fromJson(snapshotId.data()!);

    return doctor;
  }

  Future<List<DoctorModel>> getAllDoctors() async {
    List<DoctorModel> listDoctors = [];
    final collectionDoctors =
        db.collection('users').where('isDoctor', isEqualTo: 'true');
    final snapshot = await collectionDoctors.get();
    snapshot.docs.forEach(
      (element) {
        DoctorModel doctor = DoctorModel();
        doctor.fromJson(element);
        listDoctors.add(doctor);
      },
    );
    print(listDoctors.length);

    return listDoctors;
  }

  Future<List<DoctorModel>> getSpecialityDoctors(String speciality) async {
    List<DoctorModel> listDoctors = [];
    final docDoctors = db
        .collection('users')
        .where('isDoctor', isEqualTo: 'true')
        .where('speciality', isEqualTo: speciality);
    final snapshot = await docDoctors.get();
    snapshot.docs.forEach(
      (element) {
        DoctorModel doctor = DoctorModel();
        doctor.fromJson(element);
        listDoctors.add(doctor);
      },
    );
    return listDoctors;
  }
}
