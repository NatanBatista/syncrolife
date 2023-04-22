import 'package:get/get.dart';

class DoctorModel extends GetxController {
  late RxString id = ''.obs;
  late RxString name = ''.obs;
  late RxString lastName = ''.obs;
  late RxString email = ''.obs;
  late RxString phone = ''.obs;
  late RxString cpf = ''.obs;
  late RxString rating = ''.obs;
  late RxString appointments = ''.obs;
  late RxString crm = ''.obs;
  late RxString speciality = ''.obs;
  late RxString status = ''.obs;
  late RxString imageUrl = ''.obs;
  late RxString coverUrl = ''.obs;
  late RxString appointmentValue = ''.obs;
  late RxString date = ''.obs;

  Future fromJson(json) async {
    id.value = json['id'];
    name.value = json['name'];
    lastName.value = json['lastName'];
    email.value = json['email'];
    phone.value = json['phoneNumber'];
    cpf.value = json['cpf'];
    rating.value = json['rating'];
    appointments.value = json['appointments'];
    crm.value = json['crm'];
    speciality.value = json['speciality'];
    status.value = json['status'];
    imageUrl.value = json['imageUrl'];
    coverUrl.value = json['coverUrl'];
    appointmentValue.value = json['appointmentValue'];
    date.value = json['date'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id.value;
    data['name'] = name.value;
    data['last-name'] = lastName.value;
    data['email'] = email.value;
    data['phone'] = phone.value;
    data['cpf'] = cpf.value;
    data['rating'] = rating.value;
    data['rating'] = appointments.value;
    data['crm'] = crm.value;
    data['speciality'] = speciality.value;
    data['status'] = status.value;
    data['imageUrl'] = imageUrl.value;
    data['coverUrl'] = coverUrl.value;
    data['appointmentValue'] = appointmentValue.value;
    data['date'] = date.value;
    return data;
  }
}
