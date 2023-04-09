import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';

// Define um widget stateful para exibir um painel de faturamento com um valor e um seletor de período
class BillingDashboard extends StatefulWidget {
  final double valor; // Recebe um valor double como parâmetro
  const BillingDashboard({
    super.key,
    required this.valor,
  });

  @override
  State<BillingDashboard> createState() =>
      _BillingDashboardState(); // Cria o estado do widget
}

class _BillingDashboardState extends State<BillingDashboard> {
  String? valorSelecionado =
      '30D'; // Define um valor padrão para o seletor de período

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 209,
        maxWidth: 500,
      ),
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: lavenderBlush, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              subTitulos("Total faturado"), // Exibe o título "Total faturado"
              const SizedBox(
                width: 65,
              ),
              SizedBox(
                child: DropdownButton<String>(
                  value:
                      valorSelecionado, // Define o valor atual do seletor de período
                  items: <String>['30D', '15D', '7D'].map((String value) {
                    // Define as opções do seletor de período
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? novoValor) {
                    setState(() {
                      // Atualiza o valor selecionado
                      valorSelecionado = novoValor;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "R\$ ${widget.valor.toStringAsFixed(2)}", // Exibe o valor de faturamento como uma string formatada com 2 casas decimais
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
