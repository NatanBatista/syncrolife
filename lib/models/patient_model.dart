class PatientModel {
  String? name;
  String? lastName;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? date;
  int? rating;
  String? historic;
  String? status;

  PatientModel(
      {this.name,
      this.lastName,
      this.email,
      this.phone,
      this.cpf,
      this.password,
      this.date,
      this.rating,
      this.historic,
      this.status});

  PatientModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['last-name'];
    email = json['email'];
    phone = json['phone'];
    cpf = json['cpf'];
    password = json['password'];
    date = json['date'];
    rating = json['rating'];
    historic = json['historic'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['last-name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['cpf'] = this.cpf;
    data['password'] = this.password;
    data['date'] = this.date;
    data['rating'] = this.rating;
    data['historic'] = this.historic;
    data['status'] = this.status;
    return data;
  }
}