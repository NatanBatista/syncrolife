import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//PALETA DE CORES
const Color charlestonGreen = Color(0xFF0B2027);
const Color greenSheen = Color(0xFF70A9A1);
const Color cornflowerBlue = Color(0xFF7A87FB);
const Color lavenderBlush = Color(0xFFF0E6EF);
const Color lightRed = Color(0xFFEF6461);

String formattedDate(DateTime date) {
  String dataFormatada = DateFormat('dd/MM/yyyy').format(date);
  return dataFormatada;
}

//FONTES PREDEFINIDAS
Text subTitulos(String texto) {
  return Text(
    texto,
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
  );
}
