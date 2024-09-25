import 'package:flutter/material.dart';

class BorderText extends StatelessWidget {
  const BorderText({super.key, required this.title, required this.position});

  final String title;
  final int position;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Text(title,
      textAlign: TextAlign.center,
     ),
    );
  }
}
