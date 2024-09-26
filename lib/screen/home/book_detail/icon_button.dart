import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me/data/dto/Book.dart';
import 'package:me/screen/home/book_detail/LikeModel.dart';
import 'package:provider/provider.dart';



class IconButtons extends StatefulWidget  {

  // final Map<String,dynamic> bookInfo;
  // final bool  isLiked;
  final Book books ;

  IconButtons (  {super.key, required this.books,});

  @override
  State<IconButtons> createState() => _IconButtonsState();


}


class _IconButtonsState extends State<IconButtons>   {

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
          builder: (context,likeModel,child) {
            return  Container(
              height: 50,
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    likeModel.likeStatus(widget.books);
                  }, icon:  SvgPicture.asset('assets/icons/heart.svg',
                    color:
                    likeModel.isLiked? Colors.red : Colors.grey,
                    width: 20,))
                ],

              ),
            );
          }

        )
        );

  }


}
