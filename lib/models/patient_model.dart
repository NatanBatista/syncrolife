class PatientModel {
  late String _id = '';
  late String _name = '';
  late String _lastName = '';
  late String _email = '';
  late String _cpf = '';
  late String _rating = '';
  late String _status = '';
  late String _imageUrl = '';

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

  String getImage() {
    return _imageUrl;
  }

  Future fromJson(Map<String, dynamic> json) async {
    _id = json['id'];
    _name = json['name'];
    _lastName = json['lastName'];
    _email = json['email'];
    _cpf = json['cpf'];
    _rating = json['rating'];
    _status = json['status'];
    _imageUrl = json['imageUrl'];
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
    data['imageUrl'] = _imageUrl;
    return data;
  }
}
