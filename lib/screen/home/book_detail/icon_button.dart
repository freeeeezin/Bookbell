import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:me/auth/controller/AuthController.dart';
import 'package:me/auth/onGoogle.dart';
import 'package:me/controller/dialogController.dart';
import 'package:me/data/dto/Book.dart';
import 'package:me/data/provider/loginProvider.dart';
import 'package:me/data/service/userService.dart';
import 'package:me/screen/home/book_detail/LikeModel.dart';
import 'package:provider/provider.dart';



class IconButtons extends StatefulWidget  {

  final Book books ;
  final itemIndex;


   IconButtons (  {super.key, required this.books, this.itemIndex});

  @override
  State<IconButtons> createState() => _IconButtonsState();


}


class _IconButtonsState extends State<IconButtons>   {


  Dialogcontroller controller = Get.find<Dialogcontroller>();


  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: Consumer<LikeModel>(
          builder: (context,likeModel,child)   {
            return  Container(
              height: 50,
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    // likeModel.likeStatus(widget.books);
                    controller.showLike();

                  }, icon:  SvgPicture.asset('assets/icons/heart.svg',
                    color: likeModel.isb == widget.books.isbn
                        ?Colors.red : Colors.grey,
                    width: 20,))
                ],

              ),
            );
          }

        )
        );

  }



}
