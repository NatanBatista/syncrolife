// Importação das bibliotecas necessárias
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncrolife/styles.dart';

// Classe que representa um componente de requisição de consulta
class QueryRequest extends StatelessWidget {
  final String nome; // Nome do médico
  final String diaSemana; // Dia da semana da consulta
  final DateTime Data; // Data da consulta
  final TimeOfDay hora; // Hora da consulta

// Construtor da classe
  const QueryRequest(
      {super.key,
      required this.nome,
      required this.diaSemana,
      required this.Data,
      required this.hora});

  @override
  Widget build(BuildContext context) {
// Formatação da data e hora da consulta
    String dataFormatada = DateFormat('dd/MM/yyyy').format(Data);
    String horaFormatada =
        DateFormat('HH:mm').format(DateTime(1, 1, 1, hora.hour, hora.minute));
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          // Configurações de estilo do container
          constraints: const BoxConstraints(
            minHeight: 97,
            minWidth: 362,
          ),
          padding: const EdgeInsets.only(left: 15, right: 15),
          margin: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: lavenderBlush, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100,
                child: Text(nome),
              ), // Exibição do nome do médico
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(diaSemana), // Exibição do dia da semana da consulta
                  Text(dataFormatada), // Exibição da data da consulta
                  Text(horaFormatada), // Exibição da hora da consulta
                ],
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 0, 146, 75),
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
        ),
      ],
    );
  }
}
