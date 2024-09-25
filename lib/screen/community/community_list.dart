import 'package:flutter/material.dart';
import 'package:me/screen/community/club_detail/club_detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/book_club_model.dart';

class CommunityList extends StatefulWidget {

  final BookClubModel club;
  final clubIndex;



  const CommunityList({super.key, required this.club, this.clubIndex});

  @override
  State<CommunityList> createState() => _CommunityListState();
}

class _CommunityListState extends State<CommunityList> {


  @override
  Widget build(BuildContext context) {

 return Padding(
   padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
   child: GestureDetector(
     onTap: (){
       // Navigator.push(context, MaterialPageRoute(builder: (context) =>
       // ClubDetail(clubIndex: widget.clubIndex, club: widget.club,)
       // ));
     },
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(widget.club.title,style: TextStyle(
           fontSize: 18
         ),),
         const SizedBox(height: 3.0,),
         Text('${widget.club.content}'),
         const SizedBox(height: 3.0,),

       ],
     ),
   ),
 );
  }
}
