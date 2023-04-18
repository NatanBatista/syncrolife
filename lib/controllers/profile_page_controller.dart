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

//Faz a seleção da imagem de capa do médico e do paciente
  selectCoverImage() async {
    //Instância da biblioteca para fazer a seleção da imagem
    final ImagePicker picker = ImagePicker();

    try {
      //Faz a chamada da instância passando como local a galeria
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        //Chama a função que faz o recorte da imagem no tamanho correto
        pathCoverCroped = await clipImage(
          file.path,
          const CropAspectRatio(ratioX: 1080, ratioY: 720),
        );

        //Salva a imagem no Storage do Firebase e o link de download no banco de dados do usuário
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

//Faz a seleção da imagem principal do médico
  selectMainImage() async {
    //Cria uma instância da biblioteca para fazer a seleção da imagem
    final ImagePicker picker = ImagePicker();

    try {
      //Faz a chamada da instância passando como local a galeria
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        //Chama a função que faz o recorte da imagem no tamanho correto
        pathMainCroped = await clipImage(
          file.path,
          const CropAspectRatio(ratioX: 130, ratioY: 180),
        );

        //Salva a imagem no Storage do Firebase e o link de download no banco de dados do usuário
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

  //Função para recortar a imagem no tamanho que é passado em "aspectRatio"
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
