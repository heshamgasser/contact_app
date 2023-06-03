import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Color buttonColor;
  String buttonText;
  Function onTapped;

  ButtonWidget(
      {super.key, required this.buttonColor,
      required this.buttonText,
      required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        onTapped();
      },
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }


}
