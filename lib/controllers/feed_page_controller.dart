import 'package:get/get.dart';

import '../repositories/doctors_repository.dart';
import '../repositories/patient_repository.dart';

class FeedPageController extends GetxController {
  final doctorsRep = DoctorsRepository.get();
  RxList allDoctors = [].obs;
  PatientRepository patientRepository = Get.find<PatientRepository>();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    allDoctors.value = await doctorsRep.getAllDoctors();
  }
}
