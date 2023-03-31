import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 65,
      width: 55,
      child: Padding(
        padding: EdgeInsets.all(1),
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: lavenderBlush,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        ),
      ),
    );
  }
}
