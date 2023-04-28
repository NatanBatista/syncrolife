import 'package:get/get.dart';
import 'package:syncrolife/models/doctor_model.dart';
import 'package:syncrolife/repositories/doctors_repository.dart';

class SearchPageController extends GetxController {
  final doctorsRepository = Get.find<DoctorsRepository>();
  List? _cachedDoctors;

  onChanged(String value) {
    _cachedDoctors!
        .where((element) =>
            element.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  fetch() {
    _cachedDoctors = doctorsRepository.allDoctors.value;
  }
}
