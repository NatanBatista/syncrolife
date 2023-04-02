import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';
import 'package:syncrolife/widgets/custom_text_field.dart';

class CustomFormPage extends StatelessWidget {
  final String label1; //Label do campo 1
  final String label2;
  final String label3;
  final String textButton;
  final bool obsText1; //Obscure Text para senhas do campo 1
  final bool obsText2;
  final bool obsText3;
  final Color fillColor;
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final TextEditingController? controller3;
  final String rota;

  const CustomFormPage({
    Key? key,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.textButton,
    this.obsText1 = false,
    this.obsText2 = false,
    this.obsText3 = false,
    required this.fillColor,
    required this.rota,
    this.controller1,
    this.controller2,
    this.controller3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //AppBar branca com o botão de voltar a pagina
          elevation: 0,
          backgroundColor: Colors.transparent, //Cor da AppBar
          leading: Row(
            children: [
              IconButton(
                //Botão com o icone
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => (Navigator.pop(
                    context)), //Função Navigator para voltar para pagina anterior
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Widgets de campo de textos personalizados
                CustomTextField(
                  label: label1,
                  fillColor: fillColor,
                  obsText: obsText1,
                  controller: controller1,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: label2,
                  fillColor: fillColor,
                  obsText: obsText2,
                  controller: controller2,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  label: label3,
                  fillColor: fillColor,
                  obsText: obsText3,
                  controller: controller3,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButtonIcon(
                  // ElevatedButton customizado
                  buttonText: textButton, // Texto do botão
                  buttonColor: cornflowerBlue, // Background Color
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, rota);
                  },
                  icone: const Icon(Icons.navigate_next),
                ),
              ],
            ),
          ),
        ));
  }
}