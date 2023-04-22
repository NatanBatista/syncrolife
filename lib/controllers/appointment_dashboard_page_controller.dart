import 'package:get/get.dart';
import 'package:syncrolife/repositories/appointments_repository.dart';

class AppointmentDashboardPageController extends GetxController {
  final appointmentsRep = AppointmentsRepository.get();
  RxList sentAppointments = [].obs;

  void setSentAppointments() async {
    sentAppointments.value =
        await appointmentsRep.getAppointmentsFromStatus('sent');
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    sentAppointments.value =
        await appointmentsRep.getAppointmentsFromStatus('sent');
  }
}

// import 'package:get/get.dart';
// import 'package:syncrolife/repositories/appointments_repository.dart';

// class AppointmentDashboardPageController extends GetxController {
//   final appointmentsRep = AppointmentsRepository.get();
//   RxList sentAppointments = [].obs;

//   @override
//   Future<void> onInit() async {
//     // TODO: implement onInit
//     super.onInit();
//     await appointmentsRep.getAppointmentsFromStatus('sent').forEach((element) {sentAppointments.add(element);});

//     Get.reloadAll();
//   }
// }
