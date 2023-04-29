import 'package:flutter/material.dart';

import '../../../styles.dart';

class RatingStarsWidget extends StatefulWidget {
  @override
  _RatingStarsWidgetState createState() => _RatingStarsWidgetState();
}

class _RatingStarsWidgetState extends State<RatingStarsWidget> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: lavenderBlush, borderRadius: BorderRadius.circular(30)),
      height: 180,
      width: MediaQuery.of(context).size.width - 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Avalia sua experiência'),
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
              onPressed: () {},
              child: Text(
                'Enviar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
