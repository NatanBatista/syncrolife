import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';
import 'package:syncrolife/widgets/text_field_form_widget.dart';

class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextField(label: 'Senha', fillColor: lavenderBlush),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextField(
                  label: 'Repetir senha',
                  fillColor: lavenderBlush,
                  obsText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonIcon(
                  buttonText: "Confirmar",
                  buttonColor: cornflowerBlue,
                  textColor: lavenderBlush,
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  icone: const Icon(Icons.login),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
