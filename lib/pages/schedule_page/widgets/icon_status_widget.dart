import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';

Widget iconStatusWidget(String status) {
  Widget icon = Container();
  if (status == 'accepted') {
    icon = Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: cornflowerBlue, borderRadius: BorderRadius.circular(60)),
      child: Icon(
        Icons.access_time,
        color: Colors.white,
      ),
    );
  } else if (status == 'completed') {
    icon = Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: greenSheen, borderRadius: BorderRadius.circular(60)),
      child: Icon(
        Icons.check_outlined,
        color: Colors.white,
      ),
    );
  } else if (status == 'canceled') {
    icon = Container(
      alignment: Alignment.center,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: lightRed, borderRadius: BorderRadius.circular(60)),
      child: Text(
        'X',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
  return icon;
}
