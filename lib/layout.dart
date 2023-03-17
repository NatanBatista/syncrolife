import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncrolife/pages/agenda_page/agenda_page.dart';
import 'package:syncrolife/pages/feed_page/feed_page.dart';
import 'package:syncrolife/pages/perfil_page/perfil_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  PageController _pageController = PageController();
  int itemIndex = 0;

  void setItemIndex(int index) {
    setState(() {
      itemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        AgendaPage(),
        PerfilPage(),
      ]),
    );
  }
}
