// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/pages/profile_page/visitor_profile_page.dart';

import '../../../models/doctor_model.dart';
import '../../../styles.dart';

class DoctorsListWidget extends StatelessWidget {
  late List doctors;
  DoctorsListWidget({
    Key? key,
    required this.doctors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctors.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VisitorProfilePage(
                  id: doctors[index].id.value,
                  name: doctors[index].name.value,
                  lastName: doctors[index].lastName.value,
                  crm: doctors[index].crm.value,
                  speciality: doctors[index].speciality.value,
                  rating: doctors[index].rating.value,
                  appointments: doctors[index].appointments.value,
                  coverImage: doctors[index].coverUrl.value,
                  image: doctors[index].imageUrl.value,
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: (index == 19) ? 30 : 0),
            child: Container(
              width: 130,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    //Imagem do médico
                    child: doctors[index].imageUrl.value == ''
                        ? SizedBox()
                        : Image.network(
                            doctors[index].imageUrl.value,
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
                        doctors[index].rating.value,
                        style: TextStyle(fontSize: 10, color: lavenderBlush),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    child: Text(doctors[index].name.value,
                        style: TextStyle(
                            fontSize: 14,
                            color: lavenderBlush,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
