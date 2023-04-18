import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Image.asset(
              'assets/images/medico.png',
            // fit: BoxFit.cover,
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
    );
  }
}