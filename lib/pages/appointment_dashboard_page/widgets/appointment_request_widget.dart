// Importação das bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncrolife/styles.dart';

import '../../../controllers/appointment_dashboard_page_controller.dart';

// Classe que representa um componente de requisição de consulta
class AppointmentRequestWidget extends StatelessWidget {
  late List appoint;

  AppointmentRequestWidget({
    Key? key,
    required this.appoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentDashboardPageController>(
      init: AppointmentDashboardPageController(),
      builder: (_) => SizedBox(
        height: 315,
        child: ListView.builder(
          itemCount: appoint.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
            child: Container(
              // Configurações de estilo do container
              height: 97,
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  color: lavenderBlush,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(appoint[index].namePatient.value),
                  ), // Exibição do nome do médico

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_.formattedWeekday(appoint[index]
                          .date
                          .value
                          .weekday)), // Exibição do dia da semana da consulta
                      SizedBox(
                        height: 5,
                      ),
                      Text(formattedDate(appoint[index]
                          .date
                          .value)), // Exibição da data da consulta
                      SizedBox(
                        height: 5,
                      ),
                      Text(appoint[index]
                          .time
                          .value), // Exibição da hora da consulta
                    ],
                  ),
                  const SizedBox(width: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _.buttonAccepted(appoint[index].id.value);
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: greenSheen,
                              borderRadius: BorderRadius.circular(60)),
                          // Ação a ser executada ao pressionar o botão de cancelamento

                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ), // Ícone do botão de cancelamento
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          _.buttonRejected(appoint[index].id.value);
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: lightRed,
                              borderRadius: BorderRadius.circular(60)),
                          // Ação a ser executada ao pressionar o botão de cancelamento

                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ), // Ícone do botão de cancelamento
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
