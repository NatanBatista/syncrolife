import 'package:syncrolife/services/db_firestore_service.dart';

class PatientRepository {
  PatientRepository._();

  static final _instance = PatientRepository._();

  static get() {
    return _instance;
  }

  final db = DBFirestore.get();

  Future<List> getFavorites(String id) async {
    List<String> listFavorites = [];
    try {
      final collectionFavorites =
          db.collection('users').doc(id).collection('favorites');
      final snapshot = collectionFavorites.get();

      snapshot.docs.forEach((element) {
        listFavorites.add(element['id']);
      });
    } catch (e) {
      print(e);
    }

    return listFavorites;
  }
}
