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

  // String getId() {
  //   return _id.value;
  // }

  // String getName() {
  //   return _name.value;
  // }

  // String getLastName() {
  //   return _lastName.value;
  // }

  // String getEmail() {
  //   return _email.value;
  // }

  // String getCpf() {
  //   return _cpf.value;
  // }

  // String getRating() {
  //   return _rating.value;
  // }

  // String getAppointments() {
  //   return _appointments.value;
  // }

  // String getStatus() {
  //   return _status.value;
  // }

  // String getPhone() {
  //   return _phone.value;
  // }

  // String getCrm() {
  //   return _crm.value;
  // }

  // String getSpeciality() {
  //   return _speciality.value;
  // }

  // String getImageUrl() {
  //   return _imageUrl.value;
  // }

  // String getCoverUrl() {
  //   return _coverUrl.value;
  // }

  Future fromJson(Map<String, dynamic> json) async {
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
    return data;
  }
}
