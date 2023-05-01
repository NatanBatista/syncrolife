// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/controllers/register_doctor_page_controller.dart';

class SpecialitiesDropdown extends StatefulWidget {
  SpecialitiesDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<SpecialitiesDropdown> createState() => _SpecialitiesDropdownState();
}

class _SpecialitiesDropdownState extends State<SpecialitiesDropdown> {
  final _controller = Get.find<RegisterDoctorPageController>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton<String>(
          value: _controller.specialityValue.value,
          items: <String>[
            '',
            'Clínico Geral',
            'Ginecologista',
            'Neurologista',
            'Psiquiatra'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 97, 97, 97)),
                ));
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _controller.specialityValue.value = newValue!;
            });
          }),
    );
  }
}
