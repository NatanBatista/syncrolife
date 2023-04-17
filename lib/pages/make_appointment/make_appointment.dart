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
              height: MediaQuery.of(context).padding.top + 20,
            ),
            Text("Marcar consulta com"),
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/medico.png',
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text('Nome'),
                    Text('Especialidade'),
                    Text('CRM'),
                  ],
                )
              ],
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
