import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncrolife/widgets/cElevatedButtonImage.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShaderMask(
              // Widget que contém a imagem e um gradiente
              shaderCallback: (bounds) => LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 255, 255, 255), //Gradiente
                  Color.fromARGB(0, 255, 255, 255)
                ],
                tileMode: TileMode.clamp,
              ).createShader(bounds),
              child: Image.asset("assets/images/medico1.png"), //Imagem
            ),
            Container(
                // Container que contem o Text e os Dois ElevatedButton
                padding:
                    EdgeInsets.all(55), //Padding em todos os lado de 55 pixels
                child: Column(
                  children: [
                    Text(
                      "Registrar-se como:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      // Espaço entre o texto e o primeiro botão
                      height: 20,
                    ),
                    CustomButtonImage(
                      buttonText: 'Médico',
                      buttonColor: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup1');
                      },
                      assets: 'assets/icons/medico1.png',
                    ),
                    SizedBox(
                      // Espaço entre os botões
                      height: 20,
                    ),
                    CustomButtonImage(
                      buttonText: 'Paciente',
                      buttonColor: Color.fromARGB(255, 122, 135, 251),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup1');
                      },
                      assets: 'assets/icons/medicacao1.png',
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
