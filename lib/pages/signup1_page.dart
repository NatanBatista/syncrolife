import 'package:flutter/material.dart';

class SignUp1Page extends StatelessWidget {
  const SignUp1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.all(55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF0E6EF),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(20)), 
                    ),
                    label: Text("Nome"),
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            const TextField(
              decoration: InputDecoration(filled: true,
                  fillColor: Color(0xFFF0E6EF),
                  label: Text("Sobrenome"),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 1))),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: const InputDecoration(filled: true,
                  fillColor: Color(0xFFF0E6EF),
                  label: Text("CPF"),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0), width: 1))),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              // Primero botão
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF7A87FB)),
                ),
                onPressed: () {},
                child: Row(
                  // Linha que contém o icone e o nome do botão
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Próximo"), // Nome
                    SizedBox(
                      height: 10,
                    ),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
