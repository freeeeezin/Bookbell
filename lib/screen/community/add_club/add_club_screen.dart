import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:me/auth/controller/AuthController.dart';
import 'package:me/constants.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../common/screen/appbar_screen.dart';
import '../../../models/book_keyword.dart';

class AddClubScreen extends StatefulWidget {
  const AddClubScreen( {super.key});

  @override
  State<AddClubScreen> createState() => _AddClubScreenState();
}

class _AddClubScreenState extends State<AddClubScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController contentController = TextEditingController(
      text: '[ 독서 모임 모집 내용 예시 ] \n예상 모집인원:\n장소:\n지원방법:\n(ex.이메일,카카오 오픈채팅방 등)'
  );
  final Authcontroller authcontroller = Get.find<Authcontroller>();
  String? _selectedValue;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    categoryController.dispose();
    contentController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _selectedValue = searchKeyList[0];
    });
  }

  void _clear() {
    titleController.clear();
    categoryController.clear();
    contentController.clear();
  }



  Future<void> _saveDataToFirestore() async {
    try {

      await FirebaseFirestore.instance.collection('community').add({

        'title': titleController.text,
        'category': _selectedValue,
        'content': contentController.text,
        "createdDate": DateTime.now(),
        "creator": authcontroller.user.value?.displayName,
        "creatorMail": authcontroller.user.value?.email


      }).then((DocumentReference docRef){
        String docUID = docRef.id;

        docRef.update({
          'uid':docUID,
        }).then((_) {
          print("Document added with UID : $docUID");
        });
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('등록 완료')),);
        _clear();
        Get.back();

    } catch (e) {
      print("Error saving data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save data')),
      );
    }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: mBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: 'BookBell'
              .text
              .xl4
              .black
              .fontFamily(GoogleFonts
              .dancingScript()
              .fontFamily!)
              .make(),
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
                    decoration: InputDecoration(
                      hintText: '제목을 입력해주세요.',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusedBorder: InputBorder.none,
                    ),
                    cursorColor: Colors.grey),
                SizedBox(
                  height: 20,
                ),
                DropdownButton<String>
                  (
                    value: _selectedValue,
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
                      await _saveDataToFirestore();
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




