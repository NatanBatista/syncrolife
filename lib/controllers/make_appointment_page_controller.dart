import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/repositories/doctors_repository.dart';
import 'package:syncrolife/services/db_firestore_service.dart';
import 'package:uuid/uuid.dart';

import '../models/doctor_model.dart';
import '../services/auth_service.dart';

class MakeAppointmentPageController extends GetxController {
  //Cria a consulta e salva no banco de dados do paciente e do médico
  Future<void> scheduleAppointment(
      String idDoctor, DateTime date, TimeOfDay time) async {
    final db = await DBFirestore.get();
    var auth = Get.find<AuthService>();
    //A consulta terá 5 status -> sent (enviada) | accepted (aceita) | rejected (rejeitada) | completed (concluída) | canceled (cancelada)
    //Se o paciente não entrar ela contará como "completed", mas se o médico não entrar ela contará como "canceled"
    try {
      String fileId = const Uuid().v4();
      final docUser = db.collection("users").doc(idDoctor);
      final snapshot = await docUser.get();

      db.collection("appointments").doc(fileId).set({
        'id': fileId,
        'idDoctor': idDoctor,
        'nameDoctor': await snapshot.data()!['name'],
        'lastNameDoctor': await snapshot.data()!['lastName'],
        'idPatient': auth.auth.currentUser!.uid,
        'namePatient': auth.patient.name.value,
        'lastNamePatient': auth.patient.lastName.value,
        'value': await snapshot.data()!['appointmentValue'],
        'date': date,
        'time': '${time.hour}:${time.minute}',
        'creationDate': DateTime.now(),
        'status': 'sent',
        'nameCall': '',
        'tokenCall': '',
        'rated': 'false'
      });

      db
          .collection("users")
          .doc(idDoctor)
          .collection("appointments")
          .doc(fileId)
          .set({'id': fileId});

      db
          .collection("users")
          .doc(auth.auth.currentUser!.uid)
          .collection("appointments")
          .doc(fileId)
          .set({'id': fileId});
    } catch (e) {
      print(e);
    }
  }

  void showAlert(BuildContext context, String idDoctor, DateTime date,
      TimeOfDay time) async {
    final doctorsRepository = Get.find<DoctorsRepository>();
    DoctorModel doctor = await doctorsRepository.getDoctorFromId(idDoctor);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Você tem certeza que quer agendar esta consulta?'),
            content: Text(
                'O valor da consulta é ${doctor.appointmentValue.value} reais.'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              ),
              MaterialButton(
                onPressed: () {
                  scheduleAppointment(idDoctor, date, time);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Confirmar'),
              ),
            ],
          );
        });
  }
}
