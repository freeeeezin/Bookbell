import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:me/common/extension/common_format.dart';
import 'package:me/constants.dart';
import 'package:me/screen/mypage/EditScreen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../auth/controller/AuthController.dart';
import '../../../controller/dialogController.dart';
import '../../../models/book_club_model.dart';

class ClubDetail extends StatelessWidget {

  final Map<String,dynamic> club;
  final clubIndex;



  const ClubDetail({super.key, required this.clubIndex, required this.club});






  @override
  Widget build(BuildContext context) {


      var timestamp = club['createdDate'] as Timestamp;

      var dateTime = timestamp.toDate();
      print(dateTime);
      var formatDate = DateFormat('yyyy.MM.dd').format(dateTime);




    final Authcontroller controller = Get.find<Authcontroller>();
    final Dialogcontroller dialogController = Get.put(Dialogcontroller());

    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: 'BookBell'.text.xl4.black.fontFamily(GoogleFonts.dancingScript().fontFamily!).make(),
        backgroundColor: mBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("제목: ${club['title']}"),
              SizedBox(height: 10,),
              Text("작성자: ${club['creator']}"),
              SizedBox(height: 5,),
              Text("작성일: ${formatDate}"),

              Divider(),
              SizedBox(height: 5,),
              Text("내용: ${club['content']}"),

              SizedBox(height: 40,),
              if( controller.user.value?.email == club['creatorMail'] && controller.user.value != null )
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //수정
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                      onPressed: (){
                        Get.to(Editscreen(club: club,clubIndex: clubIndex));
                      },
                      child: Icon(Icons.edit, color: mTextColor,)),
                  SizedBox(width: 18,),

                  //
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0
                    ),
                      onPressed: (){
                        dialogController.deldialog('${club['uid']}');
                      }, child: Icon(CupertinoIcons.delete, color: Vx.red400,)),
                ],
              )





            ],
          ),

        ),
      ),
    );
  }


}
