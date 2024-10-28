import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String teks;
  final VoidCallback onPressed;

  CustomButton({required this.teks, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(teks),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: TextStyle(fontSize: 16),
      ),
    );
  }
}
