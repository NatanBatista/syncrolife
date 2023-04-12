import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:image_picker/image_picker.dart';
import 'package:syncrolife/styles.dart';

import '../services/auth_service.dart';

class ProfilePageController extends GetxController {
  final auth = AuthService.to;
  Rx<XFile> image = XFile('').obs;
  RxString pathCroped = ''.obs;

  selectImage() async {
    final ImagePicker picker = ImagePicker();

    try {
      if (image.value.path == "") {
        print('É null');
      }
      print("Inicio" + image.value.path);
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        image.value = file;
        pathCroped.value = await clipImage(image.value.path);
      }

      print("Fim" + image.value.path);
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
