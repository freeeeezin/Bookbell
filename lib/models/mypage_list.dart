import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListMypageMenu {
  IconData icon;
  String title;

  ListMypageMenu({required this.icon, required this.title});


  static List listMypageMenu = [
    ListMypageMenu(icon: CupertinoIcons.heart, title: '좋아요'),
    ListMypageMenu(icon: CupertinoIcons.book_fill, title: '독서 모임')
  ];


}