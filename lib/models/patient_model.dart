import 'package:get/get.dart';

class PatientModel extends GetxController {
  RxString id = ''.obs;
  RxString name = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString cpf = ''.obs;
  RxString rating = ''.obs;
  RxString status = ''.obs;
  RxString coverUrl = ''.obs;

  // String getId() {
  //   return _id;
  // }

  // String getName() {
  //   return _name;
  // }

  // String getLastName() {
  //   return _lastName;
  // }

  // String getEmail() {
  //   return _email;
  // }

  // String getCpf() {
  //   return _cpf;
  // }

  // String getRating() {
  //   return _rating;
  // }

  // String getStatus() {
  //   return _status;
  // }

  // String getCoverUrl() {
  //   return _coverUrl;
  // }

  Future fromJson(Map<String, dynamic> json) async {
    id.value = json['id'];
    name.value = json['name'];
    lastName.value = json['lastName'];
    email.value = json['email'];
    cpf.value = json['cpf'];
    rating.value = json['rating'];
    status.value = json['status'];
    coverUrl.value = json['coverUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id.value;
    data['name'] = name.value;
    data['lastName'] = lastName.value;
    data['email'] = email.value;
    data['cpf'] = cpf.value;
    data['rating'] = rating.value;
    data['status'] = status.value;
    data['coverUrl'] = coverUrl.value;
    return data;
  }
}
