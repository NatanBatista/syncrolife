class DoctorModel {
  String? _name;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _cpf;
  String? _password;
  String? _date;
  int? _rating;
  int? _crm;
  String? _state;
  String? _speciality;
  String? _status;

  DoctorModel._();

  static final _instance = DoctorModel._();

  static get() {
    return _instance;
  }

  DoctorModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _lastName = json['last-name'];
    _email = json['email'];
    _phone = json['phone'];
    _cpf = json['cpf'];
    _password = json['password'];
    _date = json['date'];
    _rating = json['rating'];
    _crm = json['crm'];
    _state = json['state'];
    _speciality = json['speciality'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = _name;
    data['last-name'] = _lastName;
    data['email'] = _email;
    data['phone'] = _phone;
    data['cpf'] = _cpf;
    data['password'] = _password;
    data['date'] = _date;
    data['rating'] = _rating;
    data['crm'] = _crm;
    data['state'] = _state;
    data['speciality'] = _speciality;
    data['status'] = _status;
    return data;
  }
}
