import 'package:get/get.dart';

import '../repositories/doctors_repository.dart';
import '../repositories/patients_repository.dart';

class FeedPageController extends GetxController {
  final doctorsRep = DoctorsRepository.get();
  RxList allDoctors = [].obs;
  PatientsRepository patientRepository = Get.find<PatientsRepository>();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    allDoctors.value = await doctorsRep.getAllDoctors();
  }
}
