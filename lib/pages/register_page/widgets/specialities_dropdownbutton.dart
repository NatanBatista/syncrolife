import 'package:flutter/material.dart';

class SpecialitiesDropdown extends StatefulWidget {
  const SpecialitiesDropdown({super.key});

  @override
  State<SpecialitiesDropdown> createState() => _SpecialitiesDropdownState();
}

class _SpecialitiesDropdownState extends State<SpecialitiesDropdown> {
  String dropdownValue = 'Clinico Geral';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DropdownButton <String>(

        value: dropdownValue,

        items: <String>['Clinico Geral', 'Ginecologista', 'Neurologista', 'Psiquiatra']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 30),
                            )
                          );
                      }).toList() ,

        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        }
        ),
    );
  }
}