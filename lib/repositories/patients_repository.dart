import 'package:get/get.dart';
import 'package:syncrolife/repositories/doctors_repository.dart';
import 'package:syncrolife/services/db_firestore_service.dart';

import '../models/doctor_model.dart';
import '../services/auth_service.dart';

class PatientsRepository extends GetxController {
  DoctorsRepository doctorsRepository = DoctorsRepository.get();
  AuthService auth = Get.find<AuthService>();
  final db = DBFirestore.get();
  RxList listFavoritesId = [].obs;
  RxList listFavoritesModel = [].obs;

  @override
  void onInit() async {
    super.onInit();
    await getFavorites();
  }

  Future<void> getFavorites() async {
    print('Pegando favoritos');
    try {
      final collectionFavorites = await db
          .collection('users')
          .doc(auth.auth.currentUser!.uid)
          .collection('favorites');
      final snapshot = await collectionFavorites.get();

      snapshot.docs.forEach((element) async {
        listFavoritesId.value.add(element['id']);
        listFavoritesModel
            .add(await doctorsRepository.getDoctorFromId(element['id']));
      });
    } catch (e) {
      print('Pegando favoritos ERRO');

      print(e);
    }
  }

  Future<void> addFavorite(String id) async {
    try {
      listFavoritesId.value.add(id);
      listFavoritesModel.add(await doctorsRepository.getDoctorFromId(id));
      await db
          .collection('users')
          .doc(auth.auth.currentUser!.uid)
          .collection('favorites')
          .doc(id)
          .set({'id': id});
    } catch (e) {
      print(e);
    }
  }

  Future<void> removeFavorite(String id) async {
    try {
      listFavoritesId.value.removeWhere((value) => value == id);
      DoctorModel doctorToRemove = listFavoritesModel.value
          .firstWhere((doctor) => doctor.id.value == id);
      listFavoritesModel.remove(doctorToRemove);

      await db
          .collection('users')
          .doc(auth.auth.currentUser!.uid)
          .collection('favorites')
          .doc(id)
          .delete();
      update();
    } catch (e) {
      print(e);
    }
  }
}
