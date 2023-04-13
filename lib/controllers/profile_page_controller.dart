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
  var pathCoverCroped = '';
  var pathMainCroped = '';

  selectCoverImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        pathCoverCroped = await clipImage(
          file.path,
          const CropAspectRatio(ratioX: 1080, ratioY: 720),
        );

        await storage
            .ref('covers/${auth.auth.currentUser?.uid}')
            .putFile(File(pathCoverCroped));
        Reference ref =
            storage.ref().child('covers/${auth.auth.currentUser?.uid}');
        String linkDownload = await ref.getDownloadURL();

        db
            .collection('users')
            .doc(auth.auth.currentUser!.uid)
            .update({'coverUrl': linkDownload});

        auth.readUser();
      }
    } catch (e) {
      print(e);
    }
  }

  selectMainImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        pathMainCroped = await clipImage(
          file.path,
          const CropAspectRatio(ratioX: 130, ratioY: 180),
        );

        await storage
            .ref('images/${auth.auth.currentUser?.uid}')
            .putFile(File(pathMainCroped));
        Reference ref =
            storage.ref().child('images/${auth.auth.currentUser?.uid}');
        String linkDownload = await ref.getDownloadURL();

        db
            .collection('users')
            .doc(auth.auth.currentUser!.uid)
            .update({'imageUrl': linkDownload});

        auth.readUser();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> clipImage(String path, CropAspectRatio aspectRatio) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: aspectRatio,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Recortar',
            toolbarColor: charlestonGreen,
            // item ativo na bottom bar
            activeControlsWidgetColor: cornflowerBlue,
            // fundo
            dimmedLayerColor: Colors.grey[700],
            toolbarWidgetColor: Colors.white,
            hideBottomControls: true,
            lockAspectRatio: true),
      ],
    );
    return croppedFile!.path;
  }
}
