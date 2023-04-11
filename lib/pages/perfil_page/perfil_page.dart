// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:syncrolife/services/auth_service.dart';
import 'package:syncrolife/styles.dart';

class PerfilPage extends StatefulWidget {
  String? name;
  String? lastName;
  String? crm;
  String? speciality;
  String? rating;
  String? appointments;

  PerfilPage({
    Key? key,
    this.name,
    this.lastName,
    this.crm,
    this.speciality,
    this.rating,
    this.appointments,
  }) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final auth = AuthService.to;
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
                      onTap: () {
                        auth.logout();
                      }),
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
                            widget.name!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          auth.isDoctor.value
                              ? Column(
                                  children: [
                                    Text(
                                      widget.speciality!,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'CRM ${widget.crm}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )
                              : SizedBox(),
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
                                widget.rating!,
                                style: TextStyle(fontSize: 14),
                              ),
                              auth.isDoctor.value
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(
                                          Icons.comment,
                                          color: greenSheen,
                                        ),
                                        Text(
                                          widget.appointments!,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    )
                                  : SizedBox()
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
