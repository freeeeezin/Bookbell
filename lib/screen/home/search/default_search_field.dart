import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:me/constants.dart';
import 'package:http/http.dart' as http;
import 'package:me/screen/home/search/naverbook_service.dart';

import '../../../authInfo.dart';
import 'search_book_result.dart';

class DefaultSearchField extends StatefulWidget {
  const DefaultSearchField({super.key});

  @override
  State<DefaultSearchField> createState() => _DefaultSearchFieldState();
}

class _DefaultSearchFieldState extends State<DefaultSearchField> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  bool isFocus = false;

  final NaverbookService _naverbookService = NaverbookService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _onFocusChange();
      });
    });
  }

  void _onFocusChange() {
    setState(() {
      isFocus = !isFocus;
    });
  }

  void _unFocus() {
    _focusNode.unfocus();
    _controller.clear();
  }

  String scanISBN = '';

  Future<void> _scanBarcode() async {
    try {
      // var result = await FlutterBarcodeScanner.scanBarcode(
      //     '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // setState(() {
      //   scanISBN = result;
      // });
      // _naverbookService.searchBooks(
      //   scanISBN,
      //   100,
      // );
    } catch (e) {
      setState(() {
        scanISBN = 'Failed to get barcode.';
      });
    }
  }

  void _handleDone(String? value) {
    _controller.clear();
    _naverbookService.searchBooks(value, 100);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            textInputAction: TextInputAction.done,
            onSubmitted: _handleDone,
            focusNode: _focusNode,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.1)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: mTextColor)),
                filled: true,
                fillColor: Colors.grey[100],
                hintText: "책 제목을 입력해주세요.",
                icon: SvgPicture.asset(
                  "assets/icons/loupe.svg",
                  width: 20,
                  height: 20,
                ),
                iconColor: mTextColor),
            keyboardType: TextInputType.text,
          ),
        ),
        Container(
          width: 50,
          child: GestureDetector(
            child: IconButton(
              onPressed: () {
                _scanBarcode();
              },
              icon: Icon(Icons.qr_code_2),
            ),
          ),
        ),
        Container(
          width: isFocus ? 50 : 0,
          child: isFocus
              ? Center(
                  child: GestureDetector(
                    onTap: _unFocus,
                    child: Text(
                      "닫기",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
