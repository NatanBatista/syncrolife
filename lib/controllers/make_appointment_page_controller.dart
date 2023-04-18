import 'package:get/get.dart';
import 'package:syncrolife/services/db_firestore_service.dart';
import 'package:uuid/uuid.dart';

import '../services/auth_service.dart';

class MakeAppointmentPageController extends GetxController {
  //Cria a consulta e salva no banco de dados do paciente e do médico
  Future<void> scheduleAppointment(
      String idDoctor, String idPatient, String date) async {
    final db = await DBFirestore.get();
    var auth = Get.find<AuthService>();
    //A consulta terá 5 status -> sent (enviada) | accepted (aceita) | rejected (rejeitada) | completed (concluída) | canceled (cancelada)
    //Se o paciente não entrar ela contará como "completed", mas se o médico não entrar ela contará como "canceled"
    try {
      String fileId = Uuid().v4();

      db
          .collection("users")
          .doc(idDoctor)
          .collection("appointments")
          .doc(fileId)
          .set({
        'id': fileId,
        'idDoctor': idDoctor,
        'idPatient': idPatient,
        'date': date,
        'creationDate': DateTime.now(),
        'status': 'sent'
      });
    } catch (e) {}
  }
}
