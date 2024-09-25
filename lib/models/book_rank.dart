import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class RankList {
  String imageUrl ;
  String title;

  RankList({
    required this.imageUrl,
    required this.title
});


  static List<RankList> rankList = [
     RankList(imageUrl:'assets/image/books/동물농장.jpeg', title: '동물농장'),
    RankList(imageUrl:'assets/image/books/이기적유전자.jpeg', title: '이기적유전자'),
    RankList(imageUrl:'assets/image/books/미스터프레지던트.jpeg', title: '미스터프레지던트'),
    RankList(imageUrl:'assets/image/books/경매권리분석이렇게쉬웠어?.jpeg', title: '경매권리분석이렇게쉬웠어'),

  ];

}