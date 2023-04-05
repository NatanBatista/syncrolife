import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:syncrolife/services/db_firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  var userIsAuthenticated = false.obs;

  static AuthService get to => Get.find<AuthService>();

  Future readUser() async {
    FirebaseFirestore db = await DBFirestore.get();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _firebaseUser = Rx<User?>(auth.currentUser);
    _firebaseUser.bindStream(auth.authStateChanges());
    ever(_firebaseUser, (User? user) async {
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
      auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }

  Future<void> registerDoctor(
      String email,
      String password,
      String name,
      String lastName,
      String cpf,
      String crm,
      String phoneNumber,
      String specialty,
      BuildContext context) async {
    FirebaseFirestore db = await DBFirestore.get();

    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
      db.collection("doctors").doc(auth.currentUser?.uid).set({
        "id": auth.currentUser?.uid,
        "email": auth.currentUser?.email,
        "name": name,
        "lastName": lastName,
        "cpf": cpf,
        "crm": crm,
        "phoneNumber": phoneNumber,
        "specialty": specialty
      });
    } catch (e) {}
  }

  Future<void> registerPatient(String email, String password, String name,
      String lastName, String cpf, BuildContext context) async {
    FirebaseFirestore db = await DBFirestore.get();

    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
      db.collection("doctors").doc(auth.currentUser?.uid).set({
        "id": auth.currentUser?.uid,
        "email": auth.currentUser?.email,
        "name": name,
        "lastName": lastName,
        "cpf": cpf,
      });
    } catch (e) {}
  }

  logout() async {
    try {
      await auth.signOut();
    } catch (e) {}
  }
}
