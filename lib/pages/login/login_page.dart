import 'package:flutter/material.dart';
import 'package:syncrolife/style.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';
import 'package:syncrolife/widgets/text_field_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () => (Navigator.pop(context)),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextField(
                    label: 'E-mail', fillColor: lavenderBlush),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextField(
                  label: 'Senha',
                  fillColor: lavenderBlush,
                  obsText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButtonIcon(
                  buttonText: "Entrar",
                  buttonColor: cornflowerBlue,
                  textColor: lavenderBlush,
                  onPressed: () {},
                  icone: const Icon(Icons.login),
                )
              ],
            )),
      ),
    );
  }
}
