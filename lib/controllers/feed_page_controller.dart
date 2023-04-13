import 'package:get/get.dart';
import 'package:syncrolife/models/doctor_model.dart';

import '../repositories/doctors_repository.dart';

class FeedPageController extends GetxController {
  final doctorsRep = DoctorsRepository.get();
  RxList allDoctors = [].obs;
  RxList reumatologistasDoctors = [].obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    allDoctors.value = await doctorsRep.getAllDoctors();
    reumatologistasDoctors.value =
        await doctorsRep.getSpecialityDoctors('Reumatologista');
  }
}
