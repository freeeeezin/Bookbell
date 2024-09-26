import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/screen/home/book_detail/LikeModel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth/controller/AuthController.dart';

class LikePage extends StatefulWidget {

 LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  final List<String> items = List.generate(10, (index) => 'Item $index');
  Authcontroller controller = Get.find<Authcontroller>();

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
              List<dynamic> allLikeLists = [];

              for (var doc in documents) {
                // like_list 필드 추출
                allLikeLists = doc['like_list'];
              }

              return ListView.separated(
                  itemCount: allLikeLists.length,
                  itemBuilder: (context, index) {
                    String title = allLikeLists[index]['title'];
                    String author =
                    allLikeLists[index]['author'];
                    String imageURL =
                    allLikeLists[index]['imageURL'];

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
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Text('$title'),
                              '$author'.text.size(10).make()
                            ],
                          ),
                        ),
                         // Expanded(
                         //   flex: 1,
                         //   child: GestureDetector(
                         //       onTap: (){
                         //            LikeModel().like();
                         //       },
                         //       child: Icon(CupertinoIcons.heart, color: LikeModel().isLiked ? Colors.red : Colors.grey,)),
                         // )
                      ]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => Divider());
            }));
  }
}
