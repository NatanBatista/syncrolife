import 'dart:ffi';

import 'package:agora_token_service/agora_token_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:developer';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncrolife/pages/video_call_page/video_call_page.dart';
import 'package:uuid/uuid.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;

import '../models/appointment_model.dart';
import '../models/doctor_model.dart';
import '../models/patient_model.dart';
import '../repositories/appointments_repository.dart';
import '../services/db_firestore_service.dart';

class AppointmentDetailsPageController extends GetxController {
  final appointmentsRep = Get.find<AppointmentsRepository>();

  Rx<AppointmentModel> appoint = AppointmentModel().obs;
  Rx<DoctorModel> doctor = DoctorModel().obs;
  Rx<PatientModel> patient = PatientModel().obs;
  RxBool isDoctor = false.obs;

  Future<void> setAppoint(String id, bool isDoctor) async {
    appoint.value = await appointmentsRep.getAppointmentFromId(id);
    setUser(isDoctor);
  }

  void setUser(bool isDoctor) async {
    print('Id paciente: ' + appoint.value.idPatient.value);
    print('Id médico: ' + appoint.value.idDoctor.value);

    final db = DBFirestore.get();

    if (isDoctor) {
      final docUser =
          await db.collection('users').doc(appoint.value.idPatient.value);

      final snapshot = await docUser.get();
      patient.value.fromJson(snapshot.data());
    } else {
      final docUser =
          await db.collection('users').doc(appoint.value.idDoctor.value);

      final snapshot = await docUser.get();
      doctor.value.fromJson(snapshot.data());
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> onJoinCall(context, String channalName, String token) async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCallPage(
          channelName: channalName,
          token: token,
        ),
      ),
    );
  }

  String generateToken(String uid, String channelName) {
    final token = RtcTokenBuilder.build(
      appId: 'fa96fc20a3b84c06b27c9d2b881c3e94',
      appCertificate: 'f76b5e64a38a4dc591412eec938c352a',
      channelName: channelName,
      uid: uid,
      role: RtcRole.publisher,
      expireTimestamp: (DateTime.now().millisecondsSinceEpoch ~/ 1000) + 4500,
    );
    return token;
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }

  void createCall(BuildContext context) async {
    print('Dentro do tempo');
    if (appoint.value.nameCall.value == '' &&
        appoint.value.tokenCall.value == '') {
      print('Criando chamada');

      String name = Uuid().v4();
      String token = generateToken(doctor.value.id.value, name);
      appointmentsRep.updateNameAndTokenCall(
          appoint.value.id.value, name, token);
      await setAppoint(appoint.value.id.value, isDoctor.value);
    }
    onJoinCall(
        context, appoint.value.nameCall.value, appoint.value.tokenCall.value);
  }

  void buttonCallDoctor(BuildContext context) async {
    if (DateTime.now().isAfter(appoint.value.date.value)) {
      createCall(context);
    } else {
      if (DateTime.now().difference(appoint.value.date.value).inSeconds <=
          900) {
        createCall(context);
      } else
        showAlertVideoCall(context);
    }
  }

  void buttonCallPatient(BuildContext context) async {
    await setAppoint(appoint.value.id.value, isDoctor.value);
    if (appoint.value.nameCall.value == '' &&
        appoint.value.tokenCall.value == '') {
      showAlertVideoCall(context);
    } else
      onJoinCall(
          context, appoint.value.nameCall.value, appoint.value.tokenCall.value);
  }

  void buttonRated(double valueRating) async {
    double newRating;
    if (doctor.value.rating.value == 'N/A') {
      newRating = valueRating;
    } else {
      newRating = (double.parse(doctor.value.rating.value) *
                  double.parse(doctor.value.ratingsCount.value) +
              valueRating) /
          (double.parse(doctor.value.ratingsCount.value) + 1);
    }
    double newCount = double.parse(doctor.value.ratingsCount.value) + 1;
    appointmentsRep.updateRatingAppointment(
        appoint.value.id.value, newRating.toString(), newCount.toString());
    appoint.value.rated.value = 'true';
  }

  void showAlertVideoCall(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: isDoctor.value
                ? Text('Você não pode entrar na chamada de vídeo no momento!')
                : Text('O médico ainda não entrou na chamada!'),
            content: isDoctor.value
                ? Text(
                    'Apenas é possível entrar em 15 minutos ou menos antes da consulta.')
                : Text('Aguarde e tente novamente.'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Voltar'),
              ),
            ],
          );
        });
  }

  void showAlertAppointmentCancel(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: (DateTime.now()
                            .difference(appoint.value.date.value)
                            .inSeconds >=
                        86400) &&
                    DateTime.now().isBefore(appoint.value.date.value)
                ? Text('Você tem certeza que quer cancelar esta consulta?')
                : Text('Você não pode cancelar a consulta!'),
            content: (DateTime.now()
                            .difference(appoint.value.date.value)
                            .inSeconds >=
                        86400) &&
                    DateTime.now().isBefore(appoint.value.date.value)
                ? Text('Após apertar em confirmar não será possível reverter.')
                : Text(
                    'A consulta só pode ser cancelada em até 24 horas antes da data e horário marcados.'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: (DateTime.now()
                                .difference(appoint.value.date.value)
                                .inSeconds >=
                            86400) &&
                        DateTime.now().isBefore(appoint.value.date.value)
                    ? Text('Cancelar')
                    : Text('Voltar'),
              ),
              (DateTime.now().difference(appoint.value.date.value).inSeconds >=
                          86400) &&
                      DateTime.now().isBefore(appoint.value.date.value)
                  ? MaterialButton(
                      onPressed: () async {
                        appointmentsRep.updateStatusAppointment(
                            appoint.value.id.value, 'canceled');
                        await setAppoint(
                            appoint.value.id.value, isDoctor.value);
                        Navigator.pop(context);
                      },
                      child: Text('Confirmar'),
                    )
                  : SizedBox(),
            ],
          );
        });
  }

  void showAlertAppointmentComplete(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: (appoint.value.date.value
                            .difference(DateTime.now())
                            .inSeconds >=
                        900) &&
                    DateTime.now().isAfter(appoint.value.date.value)
                ? Text('Você tem certeza que quer concluir esta consulta?')
                : Text('Não é possível concluir a consulta'),
            content: (appoint.value.date.value
                            .difference(DateTime.now())
                            .inSeconds >=
                        900) &&
                    DateTime.now().isAfter(appoint.value.date.value)
                ? Text('Após apertar em confirmar não será possível reverter.')
                : Text(
                    'A consulta só pode ser concluída após 15 minutos do horário marcado.'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: (appoint.value.date.value
                                .difference(DateTime.now())
                                .inSeconds >=
                            900) &&
                        DateTime.now().isAfter(appoint.value.date.value)
                    ? Text('Cancelar')
                    : Text('Voltar'),
              ),
              (appoint.value.date.value.difference(DateTime.now()).inSeconds >=
                          900) &&
                      DateTime.now().isAfter(appoint.value.date.value)
                  ? MaterialButton(
                      onPressed: () async {
                        appointmentsRep.updateStatusAppointment(
                            appoint.value.id.value, 'canceled');
                        await setAppoint(
                            appoint.value.id.value, isDoctor.value);
                        Navigator.pop(context);
                      },
                      child: Text('Confirmar'),
                    )
                  : SizedBox(),
            ],
          );
        });
  }
}
