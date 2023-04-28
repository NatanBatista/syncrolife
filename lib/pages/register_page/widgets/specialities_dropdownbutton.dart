// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SpecialitiesDropdown extends StatefulWidget {
  String dropdownValue;
  SpecialitiesDropdown({
    Key? key,
    required this.dropdownValue,
  }) : super(key: key);

  @override
  State<SpecialitiesDropdown> createState() => _SpecialitiesDropdownState();
}

class _SpecialitiesDropdownState extends State<SpecialitiesDropdown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton<String>(
          value: widget.dropdownValue,
          items: <String>[
            '',
            'Clinico Geral',
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
              widget.dropdownValue = newValue!;
            });
          }),
    );
  }
}
