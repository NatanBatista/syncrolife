import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';

Widget statusAppointmentWidget(
    String status, BuildContext context, String time, DateTime date) {
  Widget icon = Container();
  if (status == 'accepted') {
    icon = Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Row(
        children: [
          Text(
            'Consulta aceita',
            style: TextStyle(color: cornflowerBlue, fontSize: 20),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                formattedDate(date),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ))
        ],
      ),
    );
  } else if (status == 'completed') {
    icon = Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Row(
        children: [
          Text(
            'Consulta concluída',
            style: TextStyle(color: greenSheen, fontSize: 20),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                formattedDate(date),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ))
        ],
      ),
    );
  } else if (status == 'canceled') {
    icon = Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: Row(
        children: [
          Text(
            'Consulta cancelada',
            style: TextStyle(color: lightRed, fontSize: 20),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                formattedDate(date),
                style: TextStyle(fontSize: 16),
              ),
            ],
          ))
        ],
      ),
    );
  }
  return icon;
}
