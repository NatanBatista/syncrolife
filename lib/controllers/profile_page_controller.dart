import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:image_picker/image_picker.dart';
import 'package:syncrolife/services/db_firestore_service.dart';
import 'package:syncrolife/services/storage_service.dart';
import 'package:syncrolife/styles.dart';

import '../services/auth_service.dart';

class ProfilePageController extends GetxController {
  final db = DBFirestore.get();
  final storage = StorageService.get();
  final auth = AuthService.to;
  var pathCroped = '';

  selectImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        pathCroped = await clipImage(file.path);

        await storage
            .ref('covers/${auth.auth.currentUser?.uid}')
            .putFile(File(pathCroped));
        Reference ref =
            storage.ref().child('covers/${auth.auth.currentUser?.uid}');
        String linkDownload = await ref.getDownloadURL();

        db
            .collection('users')
            .doc(auth.auth.currentUser!.uid)
            .update({'coverUrl': linkDownload});

        auth.readUser();
      }
    } catch (e) {}
  }

  Future<String> clipImage(String path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: [
        CropAspectRatioPreset.ratio3x2,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Recortar',
            toolbarColor: charlestonGreen,
            // item ativo na bottom bar
            activeControlsWidgetColor: cornflowerBlue,
            // fundo
            dimmedLayerColor: Colors.grey[700],
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            hideBottomControls: true,
            lockAspectRatio: true),
      ],
    );
    return croppedFile!.path;
  }
}
