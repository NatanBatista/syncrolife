import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/services/validation_service.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

import '../../../controllers/register_doctor_page_controller.dart';

final _formKey = GlobalKey<FormState>();

class RegisterDoctorPage1 extends StatelessWidget {
  const RegisterDoctorPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterDoctorPageController());

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomFormWidget(
              formKey: _formKey,
              label1: 'Nome',
              controller1: controller.nameController,
              validate1: (value) {
                //Validação do campo Nome
                if (value == null || value.isEmpty) {
                  //Valida se o campo é vazio
                  return 'Nome obrigatório'; //Retorno da validação
                }
              },
              label2: 'Sobrenome',
              controller2: controller.lastNameController,
              validate2: (value) {
                if (value == null || value.isEmpty) {
                  return 'Sobrenome obrigatório';
                }
              },
              label3: 'CPF',
              type3: TextInputType.number,
              validate3: (value) {
                if (value == null || value.isEmpty) {
                  return 'CPF obrigatório';
                } else if (!(ValidationService.isValidCPF(value))) {
                  //Testa se é um CPF válido.
                  //Se o retorno for true, o cpf é valido e não deve cair nesse if, por isso está negado ~isValidCPF
                  return 'CPF inválido';
                }
              },
              controller3: controller.cpfController,
              textButton: "Proximo",
              fillColor: lavenderBlush,
              onPressed: () {
                // Verifica se passou em todas as validações antes de prosseguir
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, '/signupMed2');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
