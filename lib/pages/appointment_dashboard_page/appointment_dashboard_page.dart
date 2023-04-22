import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:syncrolife/pages/appointment_dashboard_page/widgets/billing_dashboard_widget.dart';
import 'package:syncrolife/pages/appointment_dashboard_page/widgets/appointments_widget.dart';
import 'package:syncrolife/pages/appointment_dashboard_page/widgets/appointment_request_widget.dart';
import "package:syncrolife/styles.dart";

import '../../controllers/appointment_dashboard_page_controller.dart';

class AppointmentDashboardPage extends StatefulWidget {
  const AppointmentDashboardPage({super.key}); // Widget da página de consultas

  @override
  State<AppointmentDashboardPage> createState() =>
      _AppointmentDashboardPageState(); // Retorna o estado da página de consultas
}

class _AppointmentDashboardPageState extends State<AppointmentDashboardPage> {
  @override
  Widget build(BuildContext context) {
    // Método que constrói a página
    return GetBuilder<AppointmentDashboardPageController>(
      init: AppointmentDashboardPageController(),
      builder: (_) => Scaffold(
        body: Obx(
          () => ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: const Text(
                  "Painel de consultas", // Título da página
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // Consultas Realizadas e Pendentes
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppointmentsWidget(label: "Realizadas", label1: "3"),
                  // Widget que exibe a quantidade de consultas realizadas
                  const SizedBox(
                    width: 10,
                  ),

                  AppointmentsWidget(
                      label: "Pendentes",
                      label1: "${_.sentAppointments.value.length}"),
                  // Widget que exibe a quantidade de consultas pendentes
                ],
              ),
              const SizedBox(
                // Espaço entre "Consultas Realizadas e Pendentes" e o painel de faturamento
                height: 15,
              ),
              const BillingDashboard(
                // Painel de faturamento
                valor: 170.266,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: const Text(
                      "Solicitação de consulta", // Título da seção de solicitações de consulta
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppointmentRequestWidget(appoint: _.sentAppointments.value)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
