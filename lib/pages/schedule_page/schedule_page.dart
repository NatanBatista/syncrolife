import 'package:flutter/material.dart';
import 'package:syncrolife/pages/appointment_details_page/appointment_details_page.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Text('Hugo Oliveira'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('15:30'),
                        Text('05/10/2023'),
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
                itemCount: 50),
          ),
        ],
      ),
    );
  }
}
