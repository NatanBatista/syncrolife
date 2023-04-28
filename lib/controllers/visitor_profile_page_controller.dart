import 'package:get/get.dart';
import 'package:syncrolife/repositories/patients_repository.dart';
import 'package:syncrolife/services/auth_service.dart';

import 'feed_page_controller.dart';

class VisitorProfilePageController extends GetxController {
  AuthService auth = Get.find<AuthService>();
  PatientsRepository patientRepository = Get.find<PatientsRepository>();

  void buttonFavorite(String id) async {
    patientRepository.listFavoritesId.value.contains(id)
        ? patientRepository.removeFavorite(id)
        : patientRepository.addFavorite(id);
    ;
    update();
  }
}
