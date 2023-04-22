// Importação das bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncrolife/styles.dart';

// Classe que representa um componente de requisição de consulta
class QueryRequest extends StatelessWidget {
  late List appoint;

  QueryRequest({
    Key? key,
    required this.appoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: appoint.length,
        itemBuilder: (context, index) {
          String dataFormatada =
              DateFormat('dd/MM/yyyy').format(appoint[index].date.value);

          Container(
            // Configurações de estilo do container
            constraints: const BoxConstraints(
              minHeight: 97,
              minWidth: 362,
            ),
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                color: lavenderBlush, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(appoint[index].status.value),
                ), // Exibição do nome do médico
                const SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                        "Segunda-feira"), // Exibição do dia da semana da consulta
                    Text(dataFormatada), // Exibição da data da consulta
                    Text(''), // Exibição da hora da consulta
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: const Color.fromARGB(255, 0, 146, 75),
                      onPressed: () {
                        // Ação a ser executada ao pressionar o botão de confirmação
                      },
                      child: const Icon(
                          Icons.check), // Ícone do botão de confirmação
                    ),
                    const SizedBox(width: 10),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        // Ação a ser executada ao pressionar o botão de cancelamento
                      },
                      child: const Icon(
                          Icons.close), // Ícone do botão de cancelamento
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
