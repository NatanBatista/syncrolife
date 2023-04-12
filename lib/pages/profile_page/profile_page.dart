// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncrolife/controllers/profile_page_controller.dart';

import 'package:syncrolife/services/auth_service.dart';
import 'package:syncrolife/styles.dart';

class ProfilePage extends StatefulWidget {
  String? name;
  String? lastName;
  String? crm;
  String? speciality;
  String? rating;
  String? appointments;

  ProfilePage({
    Key? key,
    this.name,
    this.lastName,
    this.crm,
    this.speciality,
    this.rating,
    this.appointments,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ProfilePageController>(
        init: ProfilePageController(),
        builder: (_) => Scaffold(
                body: Obx(
              () => SizedBox(
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
                        InkWell(
                            onTap: () {
                              _.selectImage();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                height: (size.width - 20) / 1.5,
                                width: size.width - 20,
                                decoration: BoxDecoration(
                                    color: charlestonGreen,
                                    borderRadius: BorderRadius.circular(30)),
                                child: (_.pathCroped.value == '')
                                    ? Text(
                                        '+',
                                        style: TextStyle(
                                            fontSize: 50, color: Colors.white),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.file(
                                            File(_.pathCroped.value))))),
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
                                _.auth.logout();
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  _.auth.isDoctor.value
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        widget.rating!,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      _.auth.isDoctor.value
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
                                                  style:
                                                      TextStyle(fontSize: 14),
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
            )));
  }
}
