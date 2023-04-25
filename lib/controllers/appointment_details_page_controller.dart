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
  final appointmentsRep = AppointmentsRepository.get();
  Rx<AppointmentModel> appoint = AppointmentModel().obs;
  Rx<DoctorModel> doctor = DoctorModel().obs;
  Rx<PatientModel> patient = PatientModel().obs;
  RxBool isDoctor = false.obs;

  void setAppoint(String id, bool isDoctor) async {
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
    print("Token" + generateToken('1512356', 'canal1'));
  }

  Future<void> onJoinCall(context, String channalName) async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCallPage(
          channelName: channalName,
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
      expireTimestamp: 4500,
    );
    return token;
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    log(status.toString());
  }

  void buttonCallDoctor() {
    if (appoint.value.nameCall.value == '' &&
        appoint.value.tokenCall.value == '') {
      String name = Uuid().v4();
      String token = generateToken(doctor.value.id.value, name);
      appointmentsRep.updateNameAndTokenCall(appoint.value.id, name, token);
    }
  }

  void showAlertAppointmentCancel(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:
                DateTime.now().difference(appoint.value.date.value).inSeconds >=
                        86400
                    ? Text('Você tem certeza que quer cancelar esta consulta?')
                    : Text('Você não pode cancelar a consulta!'),
            content: DateTime.now()
                        .difference(appoint.value.date.value)
                        .inSeconds >=
                    86400
                ? Text('Após apertar em confirmar não será possível reverter.')
                : Text(
                    'A consulta só pode ser cancelada em até 24 horas antes da data e horário marcados.'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: DateTime.now()
                            .difference(appoint.value.date.value)
                            .inSeconds >=
                        86400
                    ? Text('Cancelar')
                    : Text('Voltar'),
              ),
              DateTime.now().difference(appoint.value.date.value).inSeconds >=
                      86400
                  ? MaterialButton(
                      onPressed: () {
                        appointmentsRep.updateStatusAppointment(
                            appoint.value.id.value, 'canceled');
                        setAppoint(appoint.value.id.value, isDoctor.value);
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
            title:
                appoint.value.date.value.difference(DateTime.now()).inSeconds >=
                        900
                    ? Text('Você tem certeza que quer concluir esta consulta?')
                    : Text('Não é possível concluir a consulta'),
            content: appoint.value.date.value
                        .difference(DateTime.now())
                        .inSeconds >=
                    900
                ? Text('Após apertar em confirmar não será possível reverter.')
                : Text(
                    'A consulta só pode ser concluída após 15 minutos do horário marcado.'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: appoint.value.date.value
                            .difference(DateTime.now())
                            .inSeconds >=
                        900
                    ? Text('Cancelar')
                    : Text('Voltar'),
              ),
              appoint.value.date.value.difference(DateTime.now()).inSeconds >=
                      900
                  ? MaterialButton(
                      onPressed: () {
                        appointmentsRep.updateStatusAppointment(
                            appoint.value.id.value, 'canceled');
                        setAppoint(appoint.value.id.value, isDoctor.value);
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
