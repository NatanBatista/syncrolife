import 'package:get/get.dart';
import 'package:syncrolife/models/doctor_model.dart';
import 'package:syncrolife/repositories/doctors_repository.dart';

class SearchPageController extends GetxController {
  final doctorsRepository = Get.find<DoctorsRepository>();
  RxList cachedDoctors = [].obs;

  onChanged(String value) {
    cachedDoctors.value = doctorsRepository.allDoctors.value
        .where((element) => (element.name.value + ' ' + element.lastName.value)
            .toLowerCase()
            .contains(value.toLowerCase()))
        .toList();
  }

  @override
  onInit() {
    cachedDoctors.value = doctorsRepository.allDoctors.value;
  }
}
