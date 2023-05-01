import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/appointment_details_page/widgets/rating_stars_widget.dart';
import 'package:syncrolife/pages/appointment_details_page/widgets/status_appointment_widget.dart';

import 'package:syncrolife/styles.dart';

import '../../controllers/appointment_details_page_controller.dart';
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
  var controller = Get.find<AppointmentDetailsPageController>();

  @override
  void initState() {
    super.initState();
    controller.isDoctor.value = widget.isDoctor;
    controller.setAppoint(widget.id, widget.isDoctor);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentDetailsPageController>(
      init: AppointmentDetailsPageController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: charlestonGreen,
          ),
        ),
        body: Obx(
          () => ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          widget.isDoctor
                              ? SizedBox()
                              : Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(13)),
                                  height: 120,
                                  width: 86,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: _.doctor.value.imageUrl.value == ''
                                        ? SizedBox()
                                        : Image.network(
                                            _.doctor.value.imageUrl.value),
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
                                      _.patient.value.name.value +
                                          " " +
                                          _.patient.value.lastName.value,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'CPF: ${_.patient.value.cpf.value}',
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
                                      ],
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _.doctor.value.name.value,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      _.doctor.value.speciality.value,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'CRM ${_.doctor.value.crm.value}',
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
                                          _.doctor.value.rating.value,
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
                    statusAppointmentWidget(
                        _.appoint.value.status.value,
                        context,
                        _.appoint.value.time.value,
                        _.appoint.value.date.value),
                    const SizedBox(
                      height: 30,
                    ),
                    _.appoint.value.status.value == 'completed'
                        ? SizedBox(
                            height: 60,
                            width: 270,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: greenSheen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {},
                                child: Text(
                                  'Gerar relatório',
                                  style: TextStyle(fontSize: 18),
                                )))
                        : SizedBox(),
                    _.appoint.value.status.value == 'accepted'
                        ? Column(
                            children: [
                              widget.isDoctor
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          width: 270,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: greenSheen,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            onPressed: () {
                                              _.showAlertAppointmentComplete(
                                                  context);
                                            },
                                            child: Text(
                                              'Concluir consulta',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              SizedBox(
                                height: 60,
                                width: 270,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: lightRed,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () {
                                    _.showAlertAppointmentCancel(context);
                                  },
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 60,
                                width: 270,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  onPressed: () => widget.isDoctor
                                      ? _.buttonCallDoctor(context)
                                      : _.buttonCallPatient(context),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.video_call),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Entrar na chamada',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    _.appoint.value.status.value == 'completed'
                        ? Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              RatingStarsWidget(
                                  rated: _.appoint.value.rated.value),
                            ],
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
