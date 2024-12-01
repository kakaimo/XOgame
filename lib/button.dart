import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Function onButtonClick;
  int index;

  Button(
      {required this.text, required this.onButtonClick, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        onPressed: () {
          onButtonClick(index);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Background color of the button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Rounded corners
          ),
          elevation: 5, // Adds a shadow for the elevated effect
          padding: const EdgeInsets.symmetric(
              vertical: 15, horizontal: 30), // Padding inside the button
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
