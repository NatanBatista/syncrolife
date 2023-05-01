import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/speciality_page/speciality_page.dart';

import '../../../styles.dart';

Widget CategoriesWidget(String speciality, String icon, Color color) {
  return InkWell(
    onTap: () => Get.to(SpecialityPage(speciality: speciality)),
    child: Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(icon),
            ),
          ),
          Text(speciality),
        ],
      ),
    ),
  );
}
