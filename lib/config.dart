import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/repositories/patients_repository.dart';
import 'package:syncrolife/services/auth_service.dart';
import 'controllers/appointment_dashboard_page_controller.dart';
import 'controllers/appointment_details_page_controller.dart';
import 'controllers/feed_page_controller.dart';
import 'controllers/visitor_profile_page_controller.dart';
import 'firebase_options.dart';
import 'models/doctor_model.dart';
import 'models/patient_model.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  Get.lazyPut<AuthService>(() => AuthService());
  Get.lazyPut(() => DoctorModel());
  Get.lazyPut(() => PatientModel());
  Get.lazyPut(() => AppointmentDashboardPageController());
  Get.lazyPut(() => VisitorProfilePageController());
  Get.put(AppointmentDetailsPageController());
  Get.lazyPut(() => PatientsRepository());
  Get.lazyPut(() => FeedPageController());
  Get.put(PatientsRepository());
}
