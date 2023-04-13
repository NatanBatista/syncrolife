class AppointmentModel {
  String _id = '';
  String _date = '';
  String _status = '';
  String _idDoctor = '';
  String _idPatient = '';

  String getId() {
    return _id;
  }

  String getDate() {
    return _date;
  }

  String getStatus() {
    return _status;
  }

  String getIdDoctor() {
    return _idDoctor;
  }

  String getIdPatient() {
    return _idPatient;
  }

  Future fromJson(Map<String, dynamic> json) async {
    _id = json['id'];
    _date = json['date'];
    _status = json['status'];
    _idDoctor = json['idDoctor'];
    _idPatient = json['idPatient'];
  }
}
