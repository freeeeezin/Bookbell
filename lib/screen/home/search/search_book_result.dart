
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/constants.dart';
import '../../../common/screen/appbar_screen.dart';
import '../../../controller/dialogController.dart';
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
    // TODO: implement initState
    super.initState();
    _itmes = widget.bookList;
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
                  return ListTile(
                    title: Text(_itmes[index]['title']),
                    subtitle: Text(authors = _itmes[index]['author'].replaceAll('^', ',')),
                    leading: Image.network(_itmes[index]['image'], width: 70,height: 70,),
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
