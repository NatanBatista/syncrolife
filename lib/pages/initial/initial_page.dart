import 'package:flutter/material.dart';
import 'package:syncrolife/style.dart';
import 'package:syncrolife/widgets/elevated_button_icon_widget.dart';
import 'package:syncrolife/widgets/elevated_button_image.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          //Widget para colocar texto em cima da foto do médico
          children: <Widget>[
            ShaderMask(
              // Widget que contém a imagem do medico e um gradiente
              shaderCallback: (bounds) => const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(
                      255, 255, 255, 255), //Gradiente que vai do branco
                  Color.fromARGB(0, 255, 255, 255) //Ao transparente
                ],
                tileMode: TileMode.clamp,
              ).createShader(bounds),
              child:
                  Image.asset("assets/images/medico1.png"), //Imagem do médico
            ),
            Positioned(
              top: 360.0,
              left: 75.0,
              child: Row(
                children: <Widget>[
                  Container(
                    // Linha Vertical Ao lado do texto
                    height: 75, // define a altura da linha
                    width: 1.0, // define a espessura da linha
                    color: Colors.black, // define a cor da linha
                  ),
                  const SizedBox(
                    //Espaço entre a Linha vertical e o Texto
                    width: 10,
                  ),
                  const Text(
                    'Faça sua consulta \nonline com os melhores \nmédicos',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 60,
              right: 60), //Padding para diminuir as laterais dos botões
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              CustomButtonIcon(
                  //Botão de fazer login
                  buttonText: 'Fazer Login',
                  buttonColor: cornflowerBlue,
                  textColor: lavenderBlush,
                  onPressed: () {},
                  icone: const Icon(Icons.navigate_next)),
              const SizedBox(
                height: 10,
              ),
              CustomButtonImage(
                  //Botão de fazer login com o google
                  buttonText: "",
                  buttonColor: lavenderBlush,
                  textColor: lavenderBlush,
                  onPressed: () {},
                  assets: 'assets/images/google.png'),
              const SizedBox(
                //Espaço entro os botões
                height: 10,
              ),
              GestureDetector(
                //Widget para capturar o gesto do click
                //e redirecionar para a pagina signup
                onTap: () => (Navigator.pushNamed(context, '/signup')),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Não tem conta? "),
                    Text(
                      "Registre agora",
                      style: TextStyle(color: cornflowerBlue),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
