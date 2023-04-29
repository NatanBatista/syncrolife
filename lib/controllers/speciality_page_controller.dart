import 'package:get/get.dart';
import 'package:syncrolife/models/doctor_model.dart';
import 'package:syncrolife/repositories/doctors_repository.dart';

class SpecialityPageController extends GetxController {
  final doctorsRepository = Get.find<DoctorsRepository>();
  RxList listDoctors = [].obs;
  void getSpecilityList(String speciality) async {
    listDoctors.value =
        await doctorsRepository.getSpecialityDoctors(speciality);
  }
}
