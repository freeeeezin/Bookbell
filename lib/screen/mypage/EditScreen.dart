import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants.dart';
import '../../models/book_keyword.dart';
import '../community/add_club/add_club_screen.dart';

class Editscreen extends StatefulWidget {

  final Map<String, dynamic> club;
  final clubIndex;
   Editscreen( {super.key, required this.club, this.clubIndex});



  @override
  State<Editscreen> createState() => _EditscreenState();


}

class _EditscreenState extends State<Editscreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController contentController = TextEditingController(
      text: '[ 독서 모임 모집 내용 예시 ] \n예상 모집인원:\n장소:\n지원방법:\n(ex.이메일,카카오 오픈채팅방 등)'
  );
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.club['title'];
    contentController.text = widget.club['content'];
    categoryController.text = widget.club['category'];
    setState(() {
     _selectedValue = searchKeyList[0];
    });
  }

  Future<void> _EditDataToFirestore() async{
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('community').doc(widget.club['uid']);

    try{
      await documentReference.update({
        'title':titleController.text,
        'category': _selectedValue,
        'content': contentController.text,
      });
     print('수정 완료');
      Get.back();
    }catch(e){
      print('수정 실패');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: mBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: 'BookBell'.text.xl4.black.fontFamily(GoogleFonts.dancingScript().fontFamily!).make(),
        backgroundColor: mBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  controller: titleController,
                  maxLines: null,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  cursorColor: Colors.grey),
              SizedBox(
                height: 20,
              ),
              DropdownButton<String>
                (
                  value:_selectedValue,
                  hint: Text('주제 선택'),
                  items: searchKeyList.map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e))
                  ).toList(),

                  onChanged: (String? newValue){
                    setState(() {
                      _selectedValue = newValue;

                    });
                  }),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: contentController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: '내용을 입력해주세요.',
                    contentPadding:
                    EdgeInsets.only(bottom: 150, left: 10, top: 0),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.1)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown)),
                    // border: const OutlineInputBorder(
                    //     borderSide: BorderSide(color: mTextColor)),
                  ),
                  cursorColor: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () async{
                    await _EditDataToFirestore();
                  }, child: '완료'.text.color(mTextColor).make()),
                  TextButton(onPressed: () {
                    Get.back();
                  }, child: '취소'.text.color(Colors.black).make()),
                ],
              )
            ],
          ),
        ),
      )
    );

  }
}
