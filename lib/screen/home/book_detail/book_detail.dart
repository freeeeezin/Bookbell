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
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> data = {
      "title": widget.bookInfo['title'],
      "author":widget.bookInfo['author'],
      "image":widget.bookInfo['image'],
      "isbn":widget.bookInfo['isbn'],
      "pubDate": widget.bookInfo['pubdate'].toString().formatDate(),
      "isLike":widget.bookInfo['isLiked']

    };
    Book books = Book.fromMap(data);

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
                      Image.network(books.imageURL
                          ,width: 200
                          ,height: 200),
                      ]
                ),
              ),
               IconButtons(itemIndex: widget.itemIndex,
                 books: books),
               Padding(
                 padding: EdgeInsets.all(30),
                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("제목: ${books.title}"),
                        Text("작가: ${books.author}"),
                        Text("출판일: ${books.pubDate}"),
                      ]
                  ),
               ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [Text(widget.bookInfo['description'],
                      style: TextStyle(fontSize: 19),)]

                ),
              )
            ],
          ),
        )
    );



  }
}
