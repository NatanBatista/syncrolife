import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncrolife/styles.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 15,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: size.width - 60,
                  width: size.width - 20,
                ),
                Container(
                  height: (size.width - 20) / 1.5,
                  width: size.width - 20,
                  decoration: BoxDecoration(
                      color: charlestonGreen,
                      borderRadius: BorderRadius.circular(30)),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: InkWell(
                    child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: cornflowerBlue,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(Icons.menu)),
                  ),
                ),
                Positioned(
                  top: (size.width) / 2,
                  child: Container(
                      height: 120,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hugo Oliveira',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Psiquiatra',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'CRM 2694/SE',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                '4,9',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.comment,
                                color: greenSheen,
                              ),
                              Text(
                                '568',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text('Apresentação'),
          ],
        ),
      ),
    );
  }
}
