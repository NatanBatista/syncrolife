import 'package:flutter/material.dart';

class DateAppointment extends StatelessWidget {
  const DateAppointment({super.key});

  @override
  Widget  build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Text('Data'),
          Text('Hora')
        ],
      )
    );
  }
}