class DoctorModel {
  late String _id = '';
  late String _name = '';
  late String _lastName = '';
  late String _email = '';
  late String _phone = '';
  late String _cpf = '';
  late String _rating = '';
  late String _appointments = '';
  late String _crm = '';
  late String _speciality = '';
  late String _status = '';
  late String _imageUrl = '';
  late String _coverUrl = '';

  DoctorModel._();

  static final _instance = DoctorModel._();

  static get() {
    return _instance;
  }

  String getId() {
    return _id;
  }

  String getName() {
    return _name;
  }

  String getLastName() {
    return _lastName;
  }

  String getEmail() {
    return _email;
  }

  String getCpf() {
    return _cpf;
  }

  String getRating() {
    return _rating;
  }

  String getAppointments() {
    return _appointments;
  }

  String getStatus() {
    return _status;
  }

  String getPhone() {
    return _phone;
  }

  String getCrm() {
    return _crm;
  }

  String getSpeciality() {
    return _speciality;
  }

  String getImageUrl() {
    return _imageUrl;
  }

  String getCoverUrl() {
    return _coverUrl;
  }

  Future fromJson(Map<String, dynamic> json) async {
    _id = json['id'];
    _name = json['name'];
    _lastName = json['lastName'];
    _email = json['email'];
    _phone = json['phoneNumber'];
    _cpf = json['cpf'];
    _rating = json['rating'];
    _appointments = json['appointments'];
    _crm = json['crm'];
    _speciality = json['speciality'];
    _status = json['status'];
    _imageUrl = json['imageUrl'];
    //_coverUrl = json['coverUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['name'] = _name;
    data['last-name'] = _lastName;
    data['email'] = _email;
    data['phone'] = _phone;
    data['cpf'] = _cpf;
    data['rating'] = _rating;
    data['rating'] = _appointments;
    data['crm'] = _crm;
    data['speciality'] = _speciality;
    data['status'] = _status;
    data['imageUrl'] = _imageUrl;
    data['coverUrl'] = _coverUrl;
    return data;
  }
}
