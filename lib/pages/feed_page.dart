import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../styles.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
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
              children: [
                Text(
                  'Populares',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container())
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: 130,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(alignment: Alignment.center, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
//Imagem do médico
                      child: Image.asset(
                        'assets/images/medico.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 130,
                        height: 180,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black54,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: cornflowerBlue,
                            borderRadius: BorderRadius.circular(30)),
                        alignment: Alignment.center,
//Avaliação do médico
                        child: Text(
                          '4.9',
                          style: TextStyle(fontSize: 10, color: lavenderBlush),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 15,
                      child: Text('Fábio Augusto',
                          style: TextStyle(
                              fontSize: 14,
                              color: lavenderBlush,
                              fontWeight: FontWeight.w500)),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
