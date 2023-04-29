import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/repositories/appointments_repository.dart';
import 'package:syncrolife/repositories/doctors_repository.dart';
import 'package:syncrolife/repositories/patients_repository.dart';
import 'package:syncrolife/services/auth_service.dart';
import 'controllers/appointment_dashboard_page_controller.dart';
import 'controllers/appointment_details_page_controller.dart';
import 'controllers/feed_page_controller.dart';
import 'controllers/recovery_page_controller.dart';
import 'controllers/search_page_controller.dart';
import 'controllers/speciality_page_controller.dart';
import 'controllers/visitor_profile_page_controller.dart';
import 'firebase_options.dart';
import 'models/doctor_model.dart';
import 'models/patient_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  Get.lazyPut(() => AuthService());
  Get.lazyPut(() => DoctorModel());
  Get.lazyPut(() => PatientModel());
  Get.lazyPut(() => AppointmentDashboardPageController());
  Get.lazyPut(() => VisitorProfilePageController());
  Get.lazyPut(() => AppointmentsRepository());
  Get.lazyPut(() => PatientsRepository());
  Get.lazyPut(() => FeedPageController());
  Get.lazyPut(() => DoctorsRepository());
  Get.lazyPut(() => SearchPageController());
  Get.lazyPut(() => SpecialityPageController());
  Get.lazyPut(() => RecoveryPageController());
  Get.put(PatientsRepository());
  Get.put(AppointmentDetailsPageController());
  Get.put(AppointmentsRepository());
  Get.put(DoctorsRepository());
  Get.put(SpecialityPageController());

  final authService = Get.find<AuthService>();

  authService.firebaseUser = Rx<User?>(authService.auth.currentUser);
  authService.firebaseUser.bindStream(authService.auth.authStateChanges());
  ever(authService.firebaseUser, (User? user) async {
    if (user != null) {
      await authService.readUser();

      authService.userIsAuthenticated.value = true;
    } else {
      authService.userIsAuthenticated.value = false;
    }
  });
}
