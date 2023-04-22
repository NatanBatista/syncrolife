import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/appointment_details_page/appointment_details_page.dart';

import '../../controllers/schedule_page_controller.dart';

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
                child: ListView.separated(
                  itemCount: _.appointments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading:
                          Text('${_.appointments[index].namePatient.value}'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${_.appointments[index].time.value}'),
                          Text(
                              '${_.formattedDate(_.appointments[index].date.value)}'),
                        ],
                      ),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AppointmentDetailsPage())),
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
            ],
          ),
        ),
      ),
    );
  }
}
