// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncrolife/controllers/appointment_details_page_controller.dart';

import '../../../styles.dart';

class RatingStarsWidget extends StatefulWidget {
  late String rated;
  RatingStarsWidget({
    Key? key,
    required this.rated,
  }) : super(key: key);
  @override
  _RatingStarsWidgetState createState() => _RatingStarsWidgetState();
}

class _RatingStarsWidgetState extends State<RatingStarsWidget> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<AppointmentDetailsPageController>();
    return Container(
        decoration: BoxDecoration(
            color: lavenderBlush, borderRadius: BorderRadius.circular(30)),
        height: 180,
        width: MediaQuery.of(context).size.width - 60,
        child: widget.rated == 'false'
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Avalie sua experiência'),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                        child: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          size: 40,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 60,
                    width: 270,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        _controller.buttonRated(_rating);
                      },
                      child: Text(
                        'Enviar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Avaliação realizada',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Icon(
                      Icons.verified,
                      size: 30,
                      color: greenSheen,
                    )
                  ],
                ),
              ));
  }
}
