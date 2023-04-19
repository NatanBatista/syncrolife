import 'package:flutter/material.dart';

class DateAppointment extends StatefulWidget {
  const DateAppointment({super.key});

  @override
  State<DateAppointment> createState() => _DateAppointmentState();
}

class _DateAppointmentState extends State<DateAppointment> {

  DateTime date = DateTime.now();

  @override
  Widget  build(BuildContext context) {
    return Scaffold(

      body: 
        SizedBox(
          width: 300,
          height: 400,
        ),
      );
  }
}