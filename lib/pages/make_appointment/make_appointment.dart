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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
          Text("Marcar consulta com"),
          DoctorProfile(),
          const DateAppointment(),
          const Payment(),
          // Bloco de paddding

        ],
      ),
    );
  }
}