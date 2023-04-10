// Importando os pacotes necessários
import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';

// Classe Queries que extende de StatelessWidget
class Queries extends StatelessWidget {
// Declarando as variáveis de instância da classe
  final String label;
  final String label1;

// Construtor da classe Queries
  Queries({
    Key? key,
    required this.label,
    required this.label1,
  }) : super(key: key);

// Método build que retorna o Widget que será renderizado na tela
  @override
  Widget build(BuildContext context) {
    return Container(
// Estilização do container
      decoration: BoxDecoration(
          color: lavenderBlush, borderRadius: BorderRadius.circular(20)),
      height: 109,
      width: 175,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
// Renderização do primeiro texto
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 15,
        ),
// Renderização do segundo texto com negrito
        Text(label1,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
