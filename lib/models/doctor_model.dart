class DoctorModel {
  String? name;
  String? lastName;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? date;
  int? rating;
  int? crm;
  String? state;
  String? speciality;
  String? status;

  DoctorModel(
      {this.name,
      this.lastName,
      this.email,
      this.phone,
      this.cpf,
      this.password,
      this.date,
      this.rating,
      this.crm,
      this.state,
      this.speciality,
      this.status});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['last-name'];
    email = json['email'];
    phone = json['phone'];
    cpf = json['cpf'];
    password = json['password'];
    date = json['date'];
    rating = json['rating'];
    crm = json['crm'];
    state = json['state'];
    speciality = json['speciality'];
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
    data['crm'] = this.crm;
    data['state'] = this.state;
    data['speciality'] = this.speciality;
    data['status'] = this.status;
    return data;
  }
}
