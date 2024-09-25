import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavItems {
  final int id;
  final String icon ;
  final String label;


  NavItems(this.label,{required this.id, required this.icon});

}


List<NavItems> navItems = [
  NavItems("home", id: 0, icon: "assets/icons/home.svg"),
  NavItems("community", id: 1, icon: "assets/icons/home.svg"),
  NavItems("mypage", id: 2, icon:"assets/icons/home.svg")
];