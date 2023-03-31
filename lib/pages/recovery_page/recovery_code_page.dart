import 'package:flutter/material.dart';
import 'package:syncrolife/pages/recovery_page/widgets/code_text_field_widget.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';

class RecoveryCodePage extends StatelessWidget {
  const RecoveryCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent, //Cor da AppBar
        leading: IconButton(
          //Botão com o icone
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => (Navigator.pop(
              context)), //Função Navigator para voltar para pagina anterior
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Digite o código que foi \n enviado ao seu e-mail",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CodeTextField(),
                CodeTextField(),
                CodeTextField(),
                CodeTextField(),
                CodeTextField(),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButtonIcon(
              buttonText: "Continuar",
              buttonColor: cornflowerBlue,
              textColor: lavenderBlush,
              onPressed: () {
                Navigator.pushNamed(context, '/recoverypw');
              },
              icone: const Icon(Icons.login),
            ),
          ],
        ),
      ),
    );
  }
}
