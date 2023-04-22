import 'package:syncrolife/models/doctor_model.dart';
import 'package:syncrolife/services/db_firestore_service.dart';

class DoctorsRepository {
  DoctorsRepository._();

  static final _instance = DoctorsRepository._();

  static get() {
    return _instance;
  }

  final db = DBFirestore.get();

  Future<List<DoctorModel>> getAllDoctors() async {
    List<DoctorModel> listDoctors = [];
    final docDoctors =
        db.collection('users').where('isDoctor', isEqualTo: 'true');
    final snapshot = await docDoctors.get();
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
