import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Color fillColor;
  final TextInputType keyboardtype;
  final TextEditingController? controller;
  final bool obsText;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.fillColor,
    this.keyboardtype = TextInputType.text,
    this.controller,
    this.obsText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextField(
        controller: controller,
        obscureText: obsText,
        keyboardType: keyboardtype,
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          label: Text(label),
        ),
      ),
    );
  }
}
