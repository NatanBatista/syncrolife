import 'package:flutter/material.dart';

class CustomButtonImage extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final String assets;

  const CustomButtonImage({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    required this.assets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      constraints: const BoxConstraints(maxWidth: 300),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: buttonColor,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(assets),
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              buttonText,
              style: TextStyle(color: textColor, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
