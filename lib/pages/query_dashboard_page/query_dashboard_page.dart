import "package:flutter/material.dart";
import 'package:syncrolife/pages/query_dashboard_page/widgets/billing_dashboard_widget.dart';
import 'package:syncrolife/pages/query_dashboard_page/widgets/queries_widget.dart';
import 'package:syncrolife/pages/query_dashboard_page/widgets/query_request_widget.dart';
import "package:syncrolife/styles.dart";

class QueryPage extends StatefulWidget {
  const QueryPage({super.key}); // Widget da página de consultas

  @override
  State<QueryPage> createState() =>
      _QueryPageState(); // Retorna o estado da página de consultas
}

class _QueryPageState extends State<QueryPage> {
  @override
  Widget build(BuildContext context) {
    // Método que constrói a página
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 40,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Painel de consultas", // Título da página
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                // Consultas Realizadas e Pendentes
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Queries(
                      label: "Realizadas",
                      label1:
                          "3"), // Widget que exibe a quantidade de consultas realizadas
                  const SizedBox(
                    width: 10,
                  ),
                  Queries(
                      label: "Pendentes",
                      label1:
                          "0") // Widget que exibe a quantidade de consultas pendentes
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
                height: 65,
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
                  QueryRequest(
                      // Widget que exibe uma solicitação de consulta
                      nome: "Natan da Silva",
                      diaSemana: "Segunda-feira",
                      Data: DateTime(2002, 4, 8),
                      hora: TimeOfDay(hour: 20, minute: 50)),
                  QueryRequest(
                      nome: "Lucas qualquer coist testando 123",
                      diaSemana: "Terça-feira",
                      Data: DateTime(2002, 4, 8),
                      hora: TimeOfDay(hour: 7, minute: 50)),
                  QueryRequest(
                      nome: "Walmor",
                      diaSemana: "Terça-feira",
                      Data: DateTime(2002, 4, 8),
                      hora: TimeOfDay(hour: 08, minute: 50)),
                  QueryRequest(
                      nome: "Ryan",
                      diaSemana: "Quinta-feira",
                      Data: DateTime(2002, 4, 8),
                      hora: TimeOfDay(hour: 8, minute: 50)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
