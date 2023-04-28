import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';
import 'package:syncrolife/pages/splash_page.dart';

import '../pages/initial_page/initial_page.dart';

class SplashInitialWidget extends StatefulWidget {
  const SplashInitialWidget({super.key});

  @override
  State<SplashInitialWidget> createState() => _SplashInitialWidgetState();
}

class _SplashInitialWidgetState extends State<SplashInitialWidget> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InitialPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? SplashPage() : Container();
  }
}
