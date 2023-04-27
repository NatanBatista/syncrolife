import 'package:get/get.dart';
import 'package:syncrolife/services/db_firestore_service.dart';

import '../services/auth_service.dart';

class PatientRepository extends GetxController {
  AuthService auth = Get.find<AuthService>();
  final db = DBFirestore.get();
  RxList listFavorites = [].obs;

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

      snapshot.docs.forEach((element) {
        listFavorites.value.add(element['id']);
      });
    } catch (e) {
      print('Pegando favoritos ERRO');

      print(e);
    }
  }

  Future<void> addFavorite(String id) async {
    try {
      listFavorites.value.add(id);
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
      listFavorites.value.removeWhere((value) => value == id);
      await db
          .collection('users')
          .doc(auth.auth.currentUser!.uid)
          .collection('favorites')
          .doc(id)
          .delete();
    } catch (e) {
      print(e);
    }
  }
}
