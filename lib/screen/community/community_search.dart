import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/constants.dart';
import 'package:me/screen/community/controller/community_controller.dart';

class CommunitySearch extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  const CommunitySearch({super.key, required this.controller,  required this.onSearch});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: TextField(
        controller: controller,
        cursorColor: Colors.grey,
        onSubmitted: (value){
          onSearch(value);
        },
        decoration: InputDecoration(
          disabledBorder: _buildOutLineInputBorder(),
          enabledBorder:  _buildOutLineInputBorder(),
          focusedBorder:  _buildOutLineInputBorder(),
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.only(left: 0,bottom: 15,top: 15,right: 0),
          hintText: '관심있는 도서 모임을 찾아 보세요.',
            hintStyle: TextStyle(fontSize: 18)
        ),
      ),
    );
  }

  _buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide:  BorderSide(
        width: 0.5, color: mTextColor
    )
    );
  }
}
