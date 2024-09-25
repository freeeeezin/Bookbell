import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/auth/controller/AuthController.dart';
import 'package:me/constants.dart';
import 'package:me/controller/dialogController.dart';
import 'package:me/data/service/communityService.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/mypage_list.dart';

class ExtendsIconTextCard extends StatefulWidget {
  final ListMypageMenu item;

  const ExtendsIconTextCard({super.key, required this.item});

  @override
  State<ExtendsIconTextCard> createState() => _ExtendsIconTextCardState(item);
}

class _ExtendsIconTextCardState extends State<ExtendsIconTextCard> {
  _ExtendsIconTextCardState(this.item);

  Authcontroller controller = Get.find<Authcontroller>();
  Dialogcontroller dialogController = Get.find<Dialogcontroller>();
  CommunityService communityService = CommunityService();

  final ListMypageMenu item;
  bool isShow = false;

  void toogle() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: mBackgroundColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(item.icon),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(item.title),
                  SizedBox(
                    width: 30,
                    child: IconButton(
                        onPressed: () {
                          toogle();
                        },
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        )),
                  )
                ],
              ),
            ),
            AnimatedContainer(
                duration: Duration(milliseconds: 350),
                curve: Curves.fastOutSlowIn,
                height: isShow ? 350 : 0,
                // decoration: BoxDecoration(color: Colors.blue[200]),
                child: item.title == '좋아요'
                    ? Center(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .where('email',
                                    isEqualTo: controller.user.value!.email)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
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
                                          child: Column(
                                            children: [
                                              Text('$title'),
                                              Text('$author'),
                                            ],
                                          ),
                                        ),
                                        Expanded(child: Icon(CupertinoIcons.heart))
                                        
                                      ]),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          Divider());
                            }))
                    : Center(
                        child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('community')
                            .where('creatorMail',
                                isEqualTo: controller.user.value!.email)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (snapshot.hasError) {
                            return Center(
                                child: Text('오류 발생: ${snapshot.error}'));
                          }

                          if (!snapshot.hasData) {
                            return Center(child: Text('데이터가 없습니다.'));
                          }
                          return ListView.separated(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var doc = snapshot.data!.docs[index];
                                var data = doc.data() as Map<String, dynamic>;
                                return ListTile(
                                    title: Text(data['title']),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(data['category']),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  dialogController
                                                      .deldialog(data['uid']);
                                                },
                                                child: '삭제'
                                                    .text
                                                    .color(mTextColor)
                                                    .make()),
                                            TextButton(
                                                onPressed: () {},
                                                child: '수정'
                                                    .text
                                                    .color(Colors.black)
                                                    .make()),
                                          ],
                                        )
                                      ],
                                    ));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Divider());
                        },
                      ))),
          ],
        ),
      ),
    );
  }
}
