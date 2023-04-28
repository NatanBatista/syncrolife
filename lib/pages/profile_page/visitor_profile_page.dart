// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:syncrolife/controllers/profile_page_controller.dart';
import 'package:syncrolife/pages/make_appointment_page/make_appointment_page.dart';
import 'package:syncrolife/pages/profile_page/widgets/drawer_widget.dart';
import 'package:syncrolife/services/auth_service.dart';
import 'package:syncrolife/styles.dart';

import '../../controllers/visitor_profile_page_controller.dart';

class VisitorProfilePage extends StatefulWidget {
  String id;
  String name;
  String lastName;
  String crm;
  String speciality;
  String rating;
  String appointments;
  String coverImage;
  String image;

  VisitorProfilePage({
    Key? key,
    required this.id,
    required this.name,
    required this.lastName,
    required this.crm,
    required this.speciality,
    required this.rating,
    required this.appointments,
    required this.coverImage,
    required this.image,
  }) : super(key: key);

  @override
  State<VisitorProfilePage> createState() => _VisitorProfilePageState();
}

class _VisitorProfilePageState extends State<VisitorProfilePage> {
  final controller = Get.find<VisitorProfilePageController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<VisitorProfilePageController>(
      init: VisitorProfilePageController(),
      builder: (_) => Scaffold(
        body: Builder(
          builder: (context) => SizedBox(
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
                      alignment: Alignment.center,
                      height: (size.width - 20) / 1.5,
                      width: size.width - 20,
                      decoration: BoxDecoration(
                          color: charlestonGreen,
                          borderRadius: BorderRadius.circular(30)),
                      child: widget.coverImage == ''
                          ? const SizedBox()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(widget.coverImage),
                            ),
                    ),
                    Positioned(
                      top: 15,
                      left: 15,
                      child: InkWell(
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: cornflowerBlue,
                                borderRadius: BorderRadius.circular(100)),
                            child: BackButton(
                              color: Colors.white,
                            )),
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
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.speciality,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'CRM ${widget.crm}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  widget.rating,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      Icons.comment,
                                      color: greenSheen,
                                    ),
                                    Text(
                                      widget.appointments,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MakeAppointmentPage(
                                      idDoctor: widget.id,
                                      crm: widget.crm,
                                      name: widget.name,
                                      speciality: widget.speciality,
                                      image: widget.image,
                                    )));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            color: cornflowerBlue,
                            borderRadius: BorderRadius.circular(30)),
                        child: const Text(
                          'Marcar consulta',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        _.buttonFavorite(widget.id);
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: cornflowerBlue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(
                          Icons.favorite,
                          color: (controller
                                  .patientRepository.listFavoritesId.value
                                  .contains(widget.id))
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text('Apresentação'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
