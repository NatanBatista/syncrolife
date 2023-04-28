import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/controllers/register_patient_page_controller.dart';
import 'package:syncrolife/services/validation_service.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

final _formKey = GlobalKey<FormState>();

class RegisterPatientPage1 extends StatelessWidget {
  RegisterPatientPage1({super.key});
  final controller = Get.put(RegisterPatientPageController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomFormWidget(
            formKey: _formKey,
            isPage3: false,
            label1: 'Nome',
            validate1: (value) {
              //Validação do campo Nome
              if (value == null || value.isEmpty) {
                //Valida se o campo é vazio
                return 'Nome obrigatório'; //Retorno da validação
              }
              return null;
            },
            controller1: controller.nameController,
            label2: 'Sobrenome',
            validate2: (value) {
              if (value == null || value.isEmpty) {
                return 'Sobrenome obrigatório';
              }
            },
            controller2: controller.lastNameController,
            label3: 'CPF',
            type3: TextInputType.number,
            onChanged3: (value) {
              final formattedValue = ValidationService.cpfFormatter(value);
              if (formattedValue != value) {
                controller.cpfController.value = TextEditingValue(
                  text: formattedValue,
                  selection:
                      TextSelection.collapsed(offset: formattedValue.length),
                );
              }
            },
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
              if (_formKey.currentState!.validate()) {
                // Verifica se passou em todas as validações antes de prosseguir
                Navigator.pushNamed(context, '/signupPaci2');
              }
            },
          ),
        ),
      ],
    );
  }
}
