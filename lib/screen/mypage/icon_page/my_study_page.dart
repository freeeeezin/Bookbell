import 'package:flutter/material.dart';
import 'package:me/constants.dart';

class MyStudy extends StatefulWidget {
  const MyStudy({super.key});

  @override
  State<MyStudy> createState() => _MyStudyState();
}

class _MyStudyState extends State<MyStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: Container(

      child: Text('스터디'),
      ),
    );
  }
}
