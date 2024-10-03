import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:me/auth/onGoogle.dart';
import 'package:me/controller/dialogController.dart';
import 'package:me/screen/home/book_detail/LikeModel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth/controller/AuthController.dart';
import '../../data/dto/Book.dart';
import '../home/book_detail/book_detail.dart';

class LikePage extends StatefulWidget {

 LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  final List<String> items = List.generate(10, (index) => 'Item $index');
  final Authcontroller controller = Get.find<Authcontroller>();
  final Dialogcontroller dialogController =  Get.find<Dialogcontroller>();
  @override
  Widget build(BuildContext context) {
    return    Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').where('email', isEqualTo: controller.user.value!.email).snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                    child: Text('오류 발생: ${snapshot.error}'));
              }

              if (!snapshot.hasData) {
                return Center(child: Text('데이터가 없습니다.'));
              }
              var documents = snapshot.data!.docs;

              // like_list 필드 추출
              List<dynamic> allLikeLists = [];
              for (var doc in documents) {
                allLikeLists = doc['like_list'];
              }


              // 전체 출력


              return ListView.separated(
                  itemCount: allLikeLists.length,
                  itemBuilder: (context, index) {
                    String title = allLikeLists[index]['title'];
                    String author = allLikeLists[index]['author'];
                    String imageURL = allLikeLists[index]['imageURL'];
                    String isbn = allLikeLists[index]['isbn'];
                    bool isLike = allLikeLists[index]['isLike'];

                    Map<String,dynamic> data = {
                      "title":  title,
                      "author": author,
                      "image": imageURL,
                      "isbn": isbn,
                      "isLiked": isLike
                    };

                    Book book = Book.fromMap(data);

                    return ListTile(
                      title: Row(children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 100,
                                  height: 80,
                                  child: imageURL != null
                                      ? Image.network(
                                    imageURL!,
                                    errorBuilder:
                                        (context, error,
                                        stackTrace) {
                                      return Image.asset(
                                          'assets/image/non_image.jpg');
                                    },
                                  )
                                      : Text('이미지가 없습니다.'))
                            ],
                          ),
                        ), // 도서 이미지
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Text('$title'),
                              '$author'.text.size(10).make()
                            ],
                          ),
                        ), // 도서 제목, 작가

                      ]),

                      trailing: IconButton(
                        icon:  SvgPicture.asset('assets/icons/heart.svg',  width: 18,
                            color:isLike? Colors.red : Colors.grey), // 좋아요 상태에 따라 색상 변경
                        onPressed: () {
                          isLike = false;
                         LikeModel().likeStatus(book, isLike);
                        },
                      ),
                      onTap: (){

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) =>
                        //         BookDetail(itemIndex: index, bookInfo: documentsData,)));
                      },



                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => Divider());
            }));
  }
}
