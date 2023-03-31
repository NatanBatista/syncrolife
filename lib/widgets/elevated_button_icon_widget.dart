import 'package:flutter/material.dart';

class CustomButtonIcon extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final Icon icone;

  const CustomButtonIcon({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    required this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, //Altura do botão
      constraints: const BoxConstraints(maxWidth: 300),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          backgroundColor: buttonColor,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buttonText), // Nome
            const SizedBox(
              width: 10,
            ),
            icone,
          ],
        ),
      ),
    );
  }
}
