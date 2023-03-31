import 'package:flutter/material.dart';
import 'package:syncrolife/styles.dart';

class ConsultaDetailsPage extends StatefulWidget {
  const ConsultaDetailsPage({super.key});

  @override
  State<ConsultaDetailsPage> createState() => _ConsultaDetailsPageState();
}

class _ConsultaDetailsPageState extends State<ConsultaDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: charlestonGreen,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  SizedBox(
                    height: 120,
                    width: 86,
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.asset('assets/images/medico.png'),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Container(
                          height: 120,
                          width: 100,
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
                    ]),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            '4,9',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.shade300),
              child: Row(
                children: [
                  Text(
                    'Consulta concluída',
                    style: TextStyle(color: greenSheen, fontSize: 20),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '15:30',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '05/10/2023',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 60,
                width: 270,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greenSheen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {},
                    child: Text(
                      'Gerar relatório',
                      style: TextStyle(fontSize: 18),
                    )))
          ],
        ),
      ),
    );
  }
}
