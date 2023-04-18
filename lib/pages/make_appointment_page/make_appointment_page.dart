// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:syncrolife/pages/make_appointment_page/widgets/date_appointment.dart';
import 'package:syncrolife/pages/make_appointment_page/widgets/doctor_profile.dart';
import 'package:syncrolife/pages/make_appointment_page/widgets/payment.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../styles.dart';
import '../../widgets/elevated_button_icon_widget.dart';

class MakeAppointmentPage extends StatefulWidget {
  String idDoctor;
  String name;
  String speciality;
  String crm;
  String image;
  MakeAppointmentPage({
    Key? key,
    required this.idDoctor,
    required this.name,
    required this.speciality,
    required this.crm,
    required this.image,
  }) : super(key: key);

  @override
  State<MakeAppointmentPage> createState() => _MakeAppointmentPageState();
}

class _MakeAppointmentPageState extends State<MakeAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () => (Navigator.pop(context)),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Marcar consulta com",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 90,
                  height: 124.62,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        //Imagem do médico
                        child: widget.image == ''
                            ? SizedBox()
                            : Image.network(
                                widget.image,
                                fit: BoxFit.cover,
                              ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 130,
                          height: 180,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black54,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.speciality),
                    SizedBox(
                      height: 10,
                    ),
                    Text(widget.crm),
                  ],
                )
              ],
            ),
            Row(
              children: [Text('Data'), Text('Hora')],
            ),
            // TableCalendar(
            //     availableCalendarFormats: {
            //       CalendarFormat.month: 'Mês',
            //       CalendarFormat.week: 'Semana',
            //       CalendarFormat.twoWeeks: '2 semanas'
            //     },
            //     focusedDay: DateTime.now(),
            //     firstDay: DateTime.now(),
            //     lastDay: DateTime.utc(DateTime.now().year + 1)),
            Expanded(child: SizedBox()),
            CustomButtonIcon(
              buttonText: "Agendar",
              buttonColor: cornflowerBlue,
              textColor: lavenderBlush,
              onPressed: () {},
              icone: const Icon(Icons.assignment_add),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
