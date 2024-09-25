import 'package:flutter/material.dart';

class MyBookClub extends StatefulWidget {
  const MyBookClub({super.key});

  @override
  State<MyBookClub> createState() => _MyBookClubState();
}

class _MyBookClubState extends State<MyBookClub> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Text('도서 모임'),
    );
  }
}
