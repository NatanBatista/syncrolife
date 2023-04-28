import 'package:get/get.dart';

import '../repositories/doctors_repository.dart';
import '../repositories/patients_repository.dart';

class FeedPageController extends GetxController {
  final doctorsRep = Get.find<DoctorsRepository>();

  PatientsRepository patientRepository = Get.find<PatientsRepository>();

  Future refresh() async {
    doctorsRep.allDoctors.value = await doctorsRep.getAllDoctors();
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
}
