import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/recovery_page/widgets/code_text_field_widget.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';

import '../../controllers/recovery_page_controller.dart';

class RecoveryCodePage extends StatefulWidget {
  const RecoveryCodePage({super.key});

  @override
  State<RecoveryCodePage> createState() => _RecoveryCodePageState();
}

class _RecoveryCodePageState extends State<RecoveryCodePage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<RecoveryPageController>();

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
      body: Column(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              6,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 35,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _controller.controllersCode[index],
                  focusNode: _controller.focusNodesCode[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  onChanged: (value) => _controller.onTextChanged(value, index),
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
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
    );
  }
}
