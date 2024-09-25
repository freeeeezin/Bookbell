import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:me/controller/dialogController.dart';
import 'package:me/data/dto/Book.dart';
import 'package:me/data/service/userService.dart';
import 'package:me/screen/community/controller/community_controller.dart';
import 'package:me/screen/home/book_detail/LikeModel.dart';
import 'package:provider/provider.dart';
import '../../../auth/controller/AuthController.dart';


class IconButtons extends StatefulWidget  {

  final Map<String,dynamic> bookInfo;


   IconButtons ({super.key,required this.bookInfo});


  @override
  State<IconButtons> createState() => _IconButtonsState();
}





class _IconButtonsState extends State<IconButtons> with ChangeNotifier  {

  @override

  // final Authcontroller controller = Get.find<Authcontroller>();

  final Userservice userService = Userservice();

  bool isFavorite = false;





  // void _toggleFavorite(){
  //   if(controller.user.value != null ){
  //     String uid = controller.user.value!.uid;
  //
  //     setState(() {
  //       isFavorite = !isFavorite;
  //
  //     });
  //
  //     if(isFavorite == true ){
  //       userService.addLikeListbyUser(widget.books, controller.user.value?.email);
  //     } else {
  //       userService.deleteLikeListbyUser(widget.bookInfo,uid);
  //     }
  //
  //   }else{
  //     dialogController.showdialog();
  //   }
  //
  //   notifyListeners();
  // }
  //





  @override
  Widget build(BuildContext context) {
    Book books = Book.fromMap(widget.bookInfo);
    return SizedBox(
        height: 50,
        width: 50,
        child: Consumer<LikeModel>(
          builder: (context,likeModel,child) {
            return    Container(
              height: 50,
              margin: EdgeInsets.only(top: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    likeModel.toggleFavorite(books);

                  }, icon:  SvgPicture.asset('assets/icons/heart.svg',
                    color: books.isLike ? Colors.red : Colors.grey,
                    // LikeModel().isLike ? Colors.red : Colors.grey,
                    width: 20,))
                ],

              ),
            );
          }

        )
        );

  }


}
