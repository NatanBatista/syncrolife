class PatientModel {
  String _id = '';
  String _name = '';
  String _lastName = '';
  String _email = '';
  String _cpf = '';
  String _rating = '';
  String _status = '';
  String _coverUrl = '';

  PatientModel._();

  static final _instance = PatientModel._();

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

  String getStatus() {
    return _status;
  }

  String getCoverUrl() {
    return _coverUrl;
  }

  Future fromJson(Map<String, dynamic> json) async {
    _id = json['id'];
    _name = json['name'];
    _lastName = json['lastName'];
    _email = json['email'];
    _cpf = json['cpf'];
    _rating = json['rating'];
    _status = json['status'];
    _coverUrl = json['coverUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = _id;
    data['name'] = _name;
    data['lastName'] = _lastName;
    data['email'] = _email;
    data['cpf'] = _cpf;
    data['rating'] = _rating;
    data['status'] = _status;
    data['coverUrl'] = _coverUrl;
    return data;
  }
}
