class PatientModel {
  String? _name;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _cpf;
  String? _password;
  String? _date;
  int? _rating;
  String? _historic;
  String? _status;

  PatientModel._();

  static final _instance = PatientModel._();

  static get() {
    return _instance;
  }

  PatientModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _lastName = json['last-name'];
    _email = json['email'];
    _phone = json['phone'];
    _cpf = json['cpf'];
    _password = json['password'];
    _date = json['date'];
    _rating = json['rating'];
    _historic = json['historic'];
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
    data['historic'] = _historic;
    data['status'] = _status;
    return data;
  }
}
