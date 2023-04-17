import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxController {
  StorageService._();
  static final _instance = StorageService._();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  static get() {
    return StorageService._instance._storage;
  }
}
