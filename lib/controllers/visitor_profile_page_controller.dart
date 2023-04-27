import 'package:get/get.dart';
import 'package:syncrolife/repositories/patient_repository.dart';
import 'package:syncrolife/services/auth_service.dart';

import 'feed_page_controller.dart';

class VisitorProfilePageController extends GetxController {
  AuthService auth = Get.find<AuthService>();
  PatientRepository patientRepository = Get.find<PatientRepository>();

  void buttonFavorite(String id) async {
    patientRepository.listFavorites.value.contains(id)
        ? patientRepository.removeFavorite(id)
        : patientRepository.addFavorite(id);
    ;
    update();
  }
}
