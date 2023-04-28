import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/services/validation_service.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/register_page/widgets/custom_form_widget.dart';

import '../../../controllers/register_doctor_page_controller.dart';

final _formKey = GlobalKey<FormState>();

class RegisterDoctorPage3 extends StatelessWidget {
  RegisterDoctorPage3({super.key});
  final controller = Get.put(RegisterDoctorPageController());
  List<String> specialtiesDropdown = ['Ginecologista', 'Clinico Geral', 'Ortopedista', 'Psiquiatra'];
  String? selectedItemDropdown;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomFormWidget(
            formKey: _formKey,
            isPage3: true,
            controller1: controller.crmController,
            label1: 'CRM',
            onChanged1: (value) {
              //Formatando o campo CRM ao mesmo tempo que digita
              final formattedValue = ValidationService.crmFormatter(value);
              if (formattedValue != value) {
                controller.crmController.value = TextEditingValue(
                  text: formattedValue,
                  selection:
                      TextSelection.collapsed(offset: formattedValue.length),
                );
              }
            },
            validate1: (value) {
              if (value == null || value.isEmpty) {
                return 'CRM obrigatório';
              } else if (value.length < 11) {
                return 'Complete com zeros a esquerda.';
              } else if (!(ValidationService.isValidCrm(value))) {
                //Validando campo
                return 'CRM inválido';
              }
            },
            label2: 'Celular',
            type2: TextInputType.number,
            onChanged2: (value) {
              final formattedValue = ValidationService.telefoneFormatter(value);
              if (formattedValue != value) {
                controller.phoneNumberController.value = TextEditingValue(
                  text: formattedValue,
                  selection:
                      TextSelection.collapsed(offset: formattedValue.length),
                );
              }
            },
            validate2: (value) {
              if (value == null || value.isEmpty) {
                return 'Número obrigatório';
              } else if (value.length < 15) {
                return 'Número inválido';
              }
            },
            controller2: controller.phoneNumberController,
            label3: '',
            validate3: (value) {
              if (value == null || value.isEmpty) {
                return 'Especialidade obrigatório';
              }
            },
            controller3: controller.specialtyController,
            textButton: "Confirmar",
            fillColor: lavenderBlush,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.register(context);
              }
            },
          ),
        )
      ],
    );
  }
}
