

import 'package:flutter/material.dart';

class Buildtextbutton extends StatefulWidget {

  final String title;
  final IconData? icon;

  const Buildtextbutton( {super.key,  required this.title,  this.icon});

  @override
  State<Buildtextbutton> createState() => _BuildtextbuttonState();
}

class _BuildtextbuttonState extends State<Buildtextbutton> {


  _BuildtextbuttonState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          child:
          Icon(
            size: 30,
            widget.icon,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 10,),
        Text(widget.title, style: TextStyle(color: Colors.black),)
      ],
    );
  }
}
