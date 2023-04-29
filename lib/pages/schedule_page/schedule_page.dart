import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/appointment_details_page/appointment_details_page.dart';
import 'package:syncrolife/pages/schedule_page/widgets/icon_status_widget.dart';

import '../../controllers/schedule_page_controller.dart';
import '../../styles.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchedulePageController>(
      init: SchedulePageController(),
      builder: (_) => Scaffold(
        body: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 24,
              ),
              const Text(
                'Consultas agendadas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _.refresh,
                  child: ListView.separated(
                    itemCount: _.appointmentsRep.appointmentsSchedule.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: [
                              iconStatusWidget(_.appointmentsRep
                                  .appointmentsSchedule[index].status.value),
                              SizedBox(
                                width: 20,
                              ),
                              _.auth.isDoctor.value
                                  ? Text(
                                      '${_.appointmentsRep.appointmentsSchedule[index].namePatient.value} ${_.appointmentsRep.appointmentsSchedule[index].lastNamePatient.value}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : Text(
                                      '${_.appointmentsRep.appointmentsSchedule[index].nameDoctor.value} ${_.appointmentsRep.appointmentsSchedule[index].lastNameDoctor.value}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                              Expanded(child: SizedBox()),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '${_.appointmentsRep.appointmentsSchedule[index].time.value}'),
                                  Text(
                                      '${formattedDate(_.appointmentsRep.appointmentsSchedule[index].date.value)}'),
                                ],
                              ),
                            ]),
                          ),
                        ),
                        onTap: () {
                          String id = _.appointmentsRep
                              .appointmentsSchedule[index].id.value;
                          bool isDoctor = _.auth.isDoctor.value;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AppointmentDetailsPage(
                                      id: id, isDoctor: isDoctor)));
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.black12,
                        height: 1.5,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: cornflowerBlue,
                          borderRadius: BorderRadius.circular(60)),
                      child: Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 13,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text('Aceita'),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: greenSheen,
                          borderRadius: BorderRadius.circular(60)),
                      child: Icon(
                        Icons.check_outlined,
                        color: Colors.white,
                        size: 13,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text('Concluída'),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: lightRed,
                          borderRadius: BorderRadius.circular(60)),
                      child: Text(
                        'X',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text('Cancelada'),
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
