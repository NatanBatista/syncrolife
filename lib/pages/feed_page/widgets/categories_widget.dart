import 'package:flutter/material.dart';

import '../../../styles.dart';

Widget CategoriesWidget(
    String especialidade, String icone, List lista, Color cor) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: cor, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(icone),
          ),
        ),
        Text(especialidade),
      ],
    ),
  );
}
