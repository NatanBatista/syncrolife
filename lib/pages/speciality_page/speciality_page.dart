// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../controllers/speciality_page_controller.dart';
import '../profile_page/visitor_profile_page.dart';

class SpecialityPage extends StatefulWidget {
  String speciality;
  SpecialityPage({
    Key? key,
    required this.speciality,
  }) : super(key: key);

  @override
  State<SpecialityPage> createState() => _SpecialityPageState();
}

class _SpecialityPageState extends State<SpecialityPage> {
  final _controller = Get.find<SpecialityPageController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.getSpecilityList(widget.speciality);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Text(
          widget.speciality,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        child: Expanded(
          child: Obx(
            () => ListView.separated(
              itemCount: _controller.listDoctors.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VisitorProfilePage(
                              id: _controller.listDoctors[index].id.value,
                              name: _controller.listDoctors[index].name.value,
                              lastName:
                                  _controller.listDoctors[index].lastName.value,
                              crm: _controller.listDoctors[index].crm.value,
                              speciality: _controller
                                  .listDoctors[index].speciality.value,
                              rating:
                                  _controller.listDoctors[index].rating.value,
                              appointments: _controller
                                  .listDoctors[index].appointments.value,
                              coverImage:
                                  _controller.listDoctors[index].coverUrl.value,
                              image: _controller
                                  .listDoctors[index].imageUrl.value))),
                  child: SizedBox(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(13)),
                            height: 60,
                            width: 43,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: _controller
                                          .listDoctors[index].imageUrl.value ==
                                      ''
                                  ? SizedBox()
                                  : Image.network(_controller
                                      .listDoctors[index].imageUrl.value),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${_controller.listDoctors[index].name} ${_controller.listDoctors[index].lastName}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${_controller.listDoctors[index].speciality}',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.black12,
                  height: 1.5,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
