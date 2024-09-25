import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:me/screen/home/search/search_book_result.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../authInfo.dart';



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
       
       
       
       
       
       






















