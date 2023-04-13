import 'package:flutter/material.dart';
import 'package:syncrolife/pages/schedule_page/schedule_page.dart';
import 'package:syncrolife/pages/feed_page/feed_page.dart';
import 'package:syncrolife/pages/profile_page/profile_page.dart';
import 'package:syncrolife/pages/query_dashboard_page/query_dashboard_page.dart';

import 'models/doctor_model.dart';
import 'services/auth_service.dart';

class LayoutDoctor extends StatefulWidget {
  const LayoutDoctor({super.key});

  @override
  State<LayoutDoctor> createState() => _LayoutState();
}

class _LayoutState extends State<LayoutDoctor> {
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
        QueryPage(),
        SchedulePage(),
        ProfilePage(
          name: auth.doctor.name.value,
          speciality: auth.doctor.speciality.value,
          rating: auth.doctor.rating.value,
          appointments: auth.doctor.appointments.value,
          crm: auth.doctor.crm.value,
        ),
      ]),
    );
  }
}
