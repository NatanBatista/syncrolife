// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncrolife/controllers/profile_page_controller.dart';
import 'package:syncrolife/pages/profile_page/widgets/drawer_widget.dart';

import 'package:syncrolife/services/auth_service.dart';
import 'package:syncrolife/styles.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key? key,
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
        drawer: const DrawerWidget(),
        body: Builder(
          builder: (context) => Obx(
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
                          _.selectCoverImage();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: (size.width - 20) / 1.5,
                          width: size.width - 20,
                          decoration: BoxDecoration(
                              color: charlestonGreen,
                              borderRadius: BorderRadius.circular(30)),
                          child: (_.auth.isDoctor.value
                                  ? _.auth.doctor.coverUrl.value == ''
                                  : _.auth.patient.coverUrl.value == '')
                              ? const Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 50, color: Colors.white),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    _.auth.isDoctor.value
                                        ? _.auth.doctor.coverUrl.value
                                        : _.auth.patient.coverUrl.value,
                                  ),
                                ),
                        ),
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
                              child: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Scaffold.of(context).openDrawer();
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
                                _.auth.isDoctor.value
                                    ? _.auth.doctor.name.value
                                    : _.auth.patient.name.value,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              _.auth.isDoctor.value
                                  ? Column(
                                      children: [
                                        Text(
                                          _.auth.doctor.speciality.value,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'CRM ${_.auth.doctor.crm.value}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    )
                                  : const SizedBox(),
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
                                  _.auth.isDoctor.value
                                      ? Text(
                                          _.auth.doctor.rating.value,
                                          style: const TextStyle(fontSize: 14),
                                        )
                                      : Text(
                                          _.auth.patient.rating.value,
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                  _.auth.isDoctor.value
                                      ? Row(
                                          children: [
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Icon(
                                              Icons.comment,
                                              color: greenSheen,
                                            ),
                                            Text(
                                              _.auth.doctor.appointments.value,
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
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
      ),
    );
  }
}
