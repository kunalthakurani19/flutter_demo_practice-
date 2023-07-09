import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color bgcolor;
  final VoidCallback onPressed;
  final double? h;
  final double? w;

  const CommonButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.bgcolor = const Color.fromARGB(255, 36, 145, 200),
      this.h = 50,
      this.w = 100});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bgcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(text)),
    );
  }
}
