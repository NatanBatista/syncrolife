import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Color fillColor;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.fillColor,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        label: Text(label),
      ),
    );
  }
}
