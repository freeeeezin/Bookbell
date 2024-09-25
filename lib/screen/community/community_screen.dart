import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/controller/dialogController.dart';
import 'package:me/screen/community/add_club/add_club_screen.dart';
import 'package:me/screen/community/community_border_text.dart';
import 'package:me/screen/community/controller/community_controller.dart';
import '../../auth/LoginPlatform.dart';
import '../../auth/controller/AuthController.dart';
import '../../constants.dart';
import '../../models/book_keyword.dart';
import 'package:me/models/book_club_model.dart';
import 'get_community_list.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final Authcontroller controller = Get.find<Authcontroller>();
  final Dialogcontroller dialogController = Get.put(Dialogcontroller());
  final CommunityController communityController = Get.put(CommunityController());
  final TextEditingController _controller = TextEditingController();
  String _search = '';


  String ? categoryValued ;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryValued = null;


  }


  @override
  Widget build(BuildContext context) {

    List<BookClubModel> clubList = BookClubModel.clubList;

    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: Container(
          child: Column(
        children: <Widget>[

          // CommunitySearch(
          //   controller: _controller,
          //   onSearch: (String value){
          //     setState(() {
          //
          //       _search = value;
          //       print('aaaa ${_search}');
          //     });
          //   }
          //
          // ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: searchKeyList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        categoryValued = searchKeyList[index].toString();
                      });
                    },
                    child: Center(
                      child: BorderText(
                        title: searchKeyList[index],
                        position: index,
                      ),
                    ),
                  );
                }),
          ),
          Expanded(child: GetCommunityList(
            categoryValued: categoryValued,
            textValued: _search,


          ))

        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mTextColor,
        onPressed: () {
          print(controller.user.value);
          if(controller.user.value != null ){
            Get.to(const AddClubScreen());


          }else{
            dialogController.showdialog();
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }





}
