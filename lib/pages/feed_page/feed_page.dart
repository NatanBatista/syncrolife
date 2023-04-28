import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/feed_page/widgets/categories_widget.dart';
import 'package:syncrolife/pages/feed_page/widgets/doctors_list_widget.dart';

import '../../controllers/feed_page_controller.dart';
import '../../styles.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedPageController>(
      init: FeedPageController(),
      builder: (_) => Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Encontre seu médico',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: charlestonGreen),
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 50, bottom: 15),
              child: Row(
                children: [subTitulos("Todos"), Expanded(child: Container())],
              ),
            ),
            DoctorsListWidget(
              doctors: _.allDoctors,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 30, bottom: 15),
              child: Row(
                children: [
                  subTitulos("Especialidades"),
                  Expanded(child: Container())
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  CategoriesWidget('Ortopedista',
                      'assets/icons/ortopedista.png', [], greenSheen),
                  CategoriesWidget('Psiquiatra', 'assets/icons/psiquiatra.png',
                      [], charlestonGreen),
                  CategoriesWidget('Ginecologista',
                      'assets/icons/ginecologista.png', [], greenSheen),
                  CategoriesWidget(
                      'Geral', 'assets/icons/geral.png', [], charlestonGreen),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 30, bottom: 15),
              child: Row(
                children: [
                  subTitulos("Favoritos"),
                  Expanded(child: Container())
                ],
              ),
            ),
            DoctorsListWidget(
              doctors: _.patientRepository.listFavoritesModel,
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
