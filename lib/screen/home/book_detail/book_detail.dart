import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me/common/extension/common_format.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../auth/controller/AuthController.dart';
import '../../../constants.dart';

import '../../../data/dto/Book.dart';
import 'icon_button.dart';

class BookDetail extends StatefulWidget {
  final Map<String,dynamic> bookInfo;
  final itemIndex;
  const BookDetail({super.key, required this.itemIndex, required this.bookInfo});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor:mBackgroundColor ,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: 'BookBell'.text.xl4.black.fontFamily(GoogleFonts.dancingScript().fontFamily!).make(),
          backgroundColor: mBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(widget.bookInfo['image']
                          ,width: 200
                          ,height: 200),
                      ]
                ),
              ),
               IconButtons(bookInfo: widget.bookInfo),
               Padding(
                 padding: EdgeInsets.all(30),
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("제목: ${widget.bookInfo['title']}"),
                        Text("작가: ${widget.bookInfo['author']}"),
                        Text("출판일: ${(widget.bookInfo['pubdate'].toString().formatDate())}"),
                      ]
                  ),
               ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text(widget.bookInfo['description'], style: TextStyle(fontSize: 19),)]

                ),
              )
            ],
          ),
        )
    );



  }
}
