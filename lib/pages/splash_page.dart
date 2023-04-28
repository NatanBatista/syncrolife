import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 160,
                  child: Image.asset("assets/images/SyncroLife.png")),
              SizedBox(
                height: 40,
              ),
              CircularProgressIndicator(
                color: greenSheen,
              )
            ],
          )),
    );
  }
}
