import 'dart:async';

import 'package:flutter/material.dart';
import 'package:me/models/book_rank.dart';

import 'package:velocity_x/velocity_x.dart';

import '../component/book_item.dart';

class BookRankScreen extends StatefulWidget {
  const BookRankScreen({super.key});

  @override
  State<BookRankScreen> createState() => _BookRankScreenState();
}

class _BookRankScreenState extends State<BookRankScreen> {



  int currentPage = 0;
  PageController _PageController = PageController(initialPage: 0);
  List<RankList> rankList = RankList.rankList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer.periodic(Duration(seconds: 5), (Timer timer){
    //   if (currentPage < rankList.length){
    //     currentPage++;
    //   }else{
    //     currentPage=0;
    //   }
    //   _PageController.animateToPage(currentPage, duration: Duration(microseconds: 350), curve: Curves.easeIn);
    // });

    // _PageController.animateToPage(currentPage, duration: Duration(microseconds: 350), curve: Curves.easeIn);

  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "이달의 도서".text.size(20).bold.make(),
          ],
        ),
        Flexible(
          flex: 3,
          child: Stack(
            children: [
              PageView.builder(
                pageSnapping: true,
                controller: _PageController,
                scrollDirection: Axis.horizontal,
                itemCount: rankList.length,
                  itemBuilder: (context,index) => Padding(padding: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 150,
                    child: BookItem(
                      rankList: rankList[index],
                    )
                  ),
              //     )
              ),
              )
            ],
          ),
        ),

      ],
    );
  }
}
