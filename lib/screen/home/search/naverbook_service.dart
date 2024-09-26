import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:me/screen/home/search/search_book_result.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../authInfo.dart';
import '../../../data/dto/Book.dart';



class NaverbookService {

  Future<void> searchBooks(String? value , double display ) async {
   apiResult(value, display);
   }

  Future<void> apiResult(String? query,  double display) async {
    final response = await http.get(
        Uri.parse('$baseUrl?query=$query&display=$display'),
        headers: {
          'X-Naver-Client-Id': clientId_n,
          'X-Naver-Client-Secret':clientSecret_n
        }
    );
    
    List<dynamic> _items = jsonDecode(response.body)['items'];

    for (int i = 0; i < _items.length; i++) {
      // 각 항목이 Map<String, dynamic>인 것을 가정
      Map<String, dynamic> item = _items[i];
      // 'isLiked'라는 새 필드를 추가하여 좋아요 상태를 저장
      item['isLiked'] = false;
      // 업데이트된 데이터를 다시 리스트에 저장 (사실상 필요 없지만 명시적으로 해보면)
      _items[i] = item;
    }




    if ( _items != null ){
      Get.to(SearchBookResult(bookList: _items));
    }

  }








  












  }


//   if(_items != null && _items.isNotEmpty){
//     Get.to(SearchBookResult(bookList: _items, total: _total, ));
//   } 
// else {
//   throw Exception('Failed to load books');
// }
//   
       
       
       
       
       
       






















