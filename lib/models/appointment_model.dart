import 'package:get/get.dart';

class AppointmentModel extends GetxController {
  RxString id = ''.obs;
  Rx<DateTime> date = DateTime.now().obs;
  RxString time = ''.obs;
  Rx<DateTime> creationDate = DateTime.now().obs;
  RxString status = ''.obs;
  RxString idDoctor = ''.obs;
  RxString nameDoctor = ''.obs;
  RxString lastNameDoctor = ''.obs;
  RxString idPatient = ''.obs;
  RxString namePatient = ''.obs;
  RxString lastNamePatient = ''.obs;
  RxDouble value = 0.0.obs;
  RxString nameCall = ''.obs;
  RxString tokenCall = ''.obs;
  RxString rated = ''.obs;

  Future fromJson(json) async {
    id.value = json['id'];
    date.value = json['date'].toDate();
    time.value = json['time'];
    creationDate.value = json['creationDate'].toDate();
    status.value = json['status'];
    idDoctor.value = json['idDoctor'];
    nameDoctor.value = json['nameDoctor'];
    lastNameDoctor.value = json['lastNameDoctor'];
    idPatient.value = json['idPatient'];
    namePatient.value = json['namePatient'];
    lastNamePatient.value = json['lastNamePatient'];
    value.value = double.parse(json['value']);
    nameCall.value = json['nameCall'];
    tokenCall.value = json['tokenCall'];
    rated.value = json['rated'];
  }
}
