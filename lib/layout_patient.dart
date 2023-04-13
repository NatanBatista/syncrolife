import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/models/patient_model.dart';
import 'package:syncrolife/pages/schedule_page/schedule_page.dart';
import 'package:syncrolife/pages/feed_page/feed_page.dart';
import 'package:syncrolife/pages/profile_page/profile_page.dart';

import 'services/auth_service.dart';

class LayoutPatient extends StatefulWidget {
  const LayoutPatient({super.key});

  @override
  State<LayoutPatient> createState() => _LayoutState();
}

class _LayoutState extends State<LayoutPatient> {
  PageController _pageController = PageController();
  int itemIndex = 0;

  void setItemIndex(int index) {
    setState(() {
      itemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var auth = AuthService.to;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: itemIndex,
          onTap: (int page) {
            setItemIndex(page);
            _pageController.animateToPage(page,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          },
          elevation: 7,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Agenda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Perfil'),
          ]),
      body: PageView(controller: _pageController, children: [
        FeedPage(),
        SchedulePage(),
        ProfilePage(
          name: auth.patient.name.value,
          rating: auth.patient.rating.value,
        ),
      ]),
    );
  }
}
