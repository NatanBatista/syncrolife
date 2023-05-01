import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:syncrolife/models/doctor_model.dart';
import 'package:syncrolife/models/patient_model.dart';
import 'package:syncrolife/services/db_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  RxBool userIsAuthenticated = false.obs;
  var isDoctor = false.obs;
  var doctor = Get.find<DoctorModel>();
  var patient = Get.find<PatientModel>();

  static AuthService get to => Get.find<AuthService>();

  Future readUser() async {
    FirebaseFirestore db = await DBFirestore.get();
    final docUser = db.collection("users").doc(auth.currentUser?.uid);
    final snapshot = await docUser.get();

    if (snapshot.exists) {
      final verification = await snapshot.data()!['isDoctor'];
      if (verification.compareTo('true') == 0) {
        isDoctor.value = true;
      } else if (verification.compareTo('false') == 0) {
        isDoctor.value = false;
      }

      if (isDoctor.value) {
        await doctor.fromJson(snapshot.data()!);
      } else {
        await patient.fromJson(snapshot.data()!);
        print(patient.name.value);
      }
      print('existe');
    } else
      print('não existe');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    auth.setLanguageCode('pt');
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, (User? user) async {
      if (user != null) {
        await readUser();

        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('O usuário ou a senha estão incorretos')),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('O usuário ou a senha estão incorretos')),
          );
        }
      }
    }
  }

  Future<void> registerDoctor(
      String email,
      String password,
      String name,
      String lastName,
      String cpf,
      String crm,
      String phoneNumber,
      String speciality,
      BuildContext context) async {
    FirebaseFirestore db = await DBFirestore.get();

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      db.collection("users").doc(auth.currentUser?.uid).set({
        "isDoctor": "true",
        "id": auth.currentUser?.uid,
        "email": auth.currentUser?.email,
        "name": name,
        "lastName": lastName,
        "cpf": cpf,
        "crm": crm,
        "phoneNumber": phoneNumber,
        "speciality": speciality,
        "rating": "N/A",
        "appointments": "0",
        "status": "active",
        "imageUrl": "",
        "coverUrl": "",
        "appointmentValue": "100",
        "date": DateTime.now(),
        "ratingsCount": "0"
      });
      //Remove as 4 telas de registro de médico que estão abertas, para que seja mostrado o layout
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {}
  }

  Future<void> registerPatient(String email, String password, String name,
      String lastName, String cpf, BuildContext context) async {
    FirebaseFirestore db = await DBFirestore.get();

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      db.collection("users").doc(auth.currentUser?.uid).set({
        "isDoctor": "false",
        "id": auth.currentUser?.uid,
        "email": auth.currentUser?.email,
        "name": name,
        "lastName": lastName,
        "cpf": cpf,
        "status": "active",
        "coverUrl": ""
      });
      //Remove as 3 telas de registro de paciente que estão abertas, para que seja mostrado o layout
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    } catch (e) {}
  }

  logout() async {
    try {
      await auth.signOut();
    } catch (e) {}
  }
}
