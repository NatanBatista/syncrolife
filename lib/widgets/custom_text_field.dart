import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Color fillColor;
  final TextInputType keyboardtype;
  void Function(String)? onChanged;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final bool obsText;

  CustomTextField({
    Key? key,
    required this.label,
    required this.fillColor,
    this.keyboardtype = TextInputType.text,
    this.onChanged,
    required this.validate,
    this.controller,
    this.obsText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextFormField(
        controller: controller,
        obscureText: obsText,
        keyboardType: keyboardtype,
        onChanged: onChanged,
        validator: validate,
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
