import 'package:get/get.dart';

class AppointmentModel extends GetxController {
  RxString id = ''.obs;
  Rx<DateTime> date = DateTime.now().obs;
  RxString time = ''.obs;
  Rx<DateTime> creationDate = DateTime.now().obs;
  RxString status = ''.obs;
  RxString idDoctor = ''.obs;
  RxString idPatient = ''.obs;

  String getId() {
    return id.value;
  }

  DateTime getDate() {
    return date.value;
  }

  String getTime() {
    return time.value;
  }

  DateTime getCreationDate() {
    return creationDate.value;
  }

  String getStatus() {
    return status.value;
  }

  String getIdDoctor() {
    return idDoctor.value;
  }

  String getIdPatient() {
    return idPatient.value;
  }

  Future fromJson(json) async {
    id.value = json['id'];
    date.value = json['date'].toDate();
    time.value = json['time'];
    creationDate.value = json['creationDate'].toDate();
    status.value = json['status'];
    idDoctor.value = json['idDoctor'];
    idPatient.value = json['idPatient'];
  }
}
