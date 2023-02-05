import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SingupPage extends StatelessWidget {
  const SingupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: Text(
              "Registrar-se como:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            Container(
                padding:
                    EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 75),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/icons/medico1.png'),
                                width: 50,
                                height: 50,
                              ),
                              Text("Médico")
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/icons/medicacao1.png'),
                                width: 50,
                                height: 50,
                              ),
                              Text("Médico")
                            ],
                          )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
