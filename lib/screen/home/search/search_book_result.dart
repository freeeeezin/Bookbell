
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:me/common/extension/common_format.dart';
import 'package:me/constants.dart';
import 'package:me/screen/home/book_detail/LikeModel.dart';
import '../../../common/screen/appbar_screen.dart';
import '../../../controller/dialogController.dart';
import '../../../data/dto/Book.dart';
import '../book_detail/book_detail.dart';

class SearchBookResult extends StatefulWidget {

  final List<dynamic> bookList;


  const SearchBookResult({super.key, required this.bookList});


  @override
  State<SearchBookResult> createState() => _SearchBookResultState();
}

class _SearchBookResultState extends State<SearchBookResult> {

  List<dynamic> _itmes = [];
  late String authors;
  final Dialogcontroller dialogController = Get.put(Dialogcontroller());

 @override
  void initState() {
   Map<String,dynamic> data = {"isLiked" : true};
   _itmes = widget.bookList;
   _itmes.add(data);
    super.initState();

  }


  @override
  Widget build(BuildContext context) {






    return Scaffold(
      backgroundColor:mBackgroundColor ,
      appBar:  PreferredSize(preferredSize: Size.fromHeight(40),
          child: AppbarScreen(true),
      ),
      body:
      Column(
            children:[
              Flexible(
                child: _itmes.isNotEmpty ?
                ListView.builder(itemBuilder:(context,index){

                  Map<String, dynamic> data = {
                    "title": _itmes[index]['title'],
                    "author":_itmes[index]['author'],
                    "image":_itmes[index]['image'],
                    "isbn":_itmes[index]['isbn'],
                    "pubDate": _itmes[index]['pubdate'].toString().formatDate(),
                    "isLiked":_itmes[index]['isLiked']

                  };
                  Book book = Book.fromMap(data);



                  return ListTile(
                    title: Text(_itmes[index]['title']),
                    subtitle: Text(authors = _itmes[index]['author'].replaceAll('^', ',')),
                    leading: Image.network(_itmes[index]['image'], width: 70,height: 70,),
                    trailing: IconButton(
                      icon:  SvgPicture.asset('assets/icons/heart.svg',  width: 18,
                          color:   _itmes[index]['isLiked']? Colors.red : Colors.grey), // 좋아요 상태에 따라 색상 변경
                      onPressed: () {
                       setState(() {
                         _itmes[index]['isLiked'] =! _itmes[index]['isLiked'];
                       });

                       LikeModel().likeStatus(book, _itmes[index]['isLiked'] );
                        // LikeModel().toggleLike(index, _itmes[index]);
                      },
                    ),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                              BookDetail(itemIndex: index, bookInfo: _itmes[index],)));
                    },
                  );
                }, itemCount: _itmes.length,)
                    : Center(
                  child: Text('일치하는 도서 결과가 없습니다.',
                      style: TextStyle(
                         fontSize: 20,
                         color: Colors.brown.withOpacity(0.6)
                     )
                  )
                )
              )
            ]
      ),



    );
  }
}
