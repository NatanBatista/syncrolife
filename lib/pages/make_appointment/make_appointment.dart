import 'package:flutter/material.dart';
import 'package:syncrolife/pages/make_appointment/widgets/date_appointment.dart';
import 'package:syncrolife/pages/make_appointment/widgets/doctor_profile.dart';
import 'package:syncrolife/pages/make_appointment/widgets/payment.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({super.key});

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text("Marcar consulta com",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/medico.png',
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nome', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),),
                        Text('Especialidade'),
                        Text('CRM'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [Text('Data'), Text('Hora')],
            ),
            Text('payment'),
            // Bloco de paddding
          ],
        ),
      ),
    );
  }
}
