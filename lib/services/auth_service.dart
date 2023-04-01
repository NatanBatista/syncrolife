import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService._();
  static final _instance = AuthService._();

  static get() {
    return AuthService._instance;
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser;
  var userIsAuthenticated = false.obs;
  static AuthService get to => Get.find<AuthService>();

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }

  Future<void> register(
      String email, String password, BuildContext context) async {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }
}
