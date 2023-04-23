// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/appointment_details_page/widgets/status_appointment_widget.dart';

import 'package:syncrolife/styles.dart';

import '../../models/appointment_model.dart';
import '../../models/doctor_model.dart';
import '../../models/patient_model.dart';
import '../../repositories/appointments_repository.dart';
import '../../services/db_firestore_service.dart';

class AppointmentDetailsPage extends StatefulWidget {
  late String id;
  late bool isDoctor;
  AppointmentDetailsPage({
    Key? key,
    required this.id,
    required this.isDoctor,
  }) : super(key: key);

  @override
  State<AppointmentDetailsPage> createState() =>
      _AppointmentDetailsPagePageState();
}

class _AppointmentDetailsPagePageState extends State<AppointmentDetailsPage> {
  AppointmentModel appoint = AppointmentModel();
  DoctorModel doctor = DoctorModel();
  PatientModel patient = PatientModel();

  void setAppoint() async {
    final appointmentsRep = AppointmentsRepository.get();
    appoint = await appointmentsRep.getAppointmentFromId(widget.id);
    setUser();
  }

  void setUser() async {
    print('Id paciente: ' + appoint.idPatient.value);
    print('Id médico: ' + appoint.idDoctor.value);

    final db = DBFirestore.get();

    if (widget.isDoctor) {
      final docUser = await db.collection('users').doc(appoint.idPatient.value);

      final snapshot = await docUser.get();
      patient.fromJson(snapshot.data());
    } else {
      final docUser = await db.collection('users').doc(appoint.idDoctor.value);

      final snapshot = await docUser.get();
      doctor.fromJson(snapshot.data());
    }
  }

  @override
  void initState() {
    super.initState();

    setAppoint();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: charlestonGreen,
        ),
      ),
      body: Obx(
        () => SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    if (widget.isDoctor)
                      SizedBox()
                    else
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(13)),
                        height: 120,
                        width: 86,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: doctor.imageUrl.value == ''
                              ? SizedBox()
                              : Image.network(doctor.imageUrl.value),
                        ),
                      ),
                    const SizedBox(
                      width: 20,
                    ),
                    widget.isDoctor
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                patient.name.value +
                                    " " +
                                    patient.lastName.value,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'CPF: ${patient.cpf.value}',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    patient.rating.value,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name.value,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                doctor.speciality.value,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'CRM ${doctor.crm.value}',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    doctor.rating.value,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              statusAppointmentWidget(appoint.status.value, context,
                  appoint.time.value, appoint.date.value),
              const SizedBox(
                height: 30,
              ),
              appoint.status.value == 'completed'
                  ? SizedBox(
                      height: 60,
                      width: 270,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: greenSheen,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Text(
                            'Gerar relatório',
                            style: TextStyle(fontSize: 18),
                          )))
                  : SizedBox(),
              appoint.status.value == 'accepted'
                  ? SizedBox(
                      height: 60,
                      width: 270,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: lightRed,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Text(
                            'Cancelar',
                            style: TextStyle(fontSize: 18),
                          )))
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
