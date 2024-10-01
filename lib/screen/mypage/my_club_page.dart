import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/screen/mypage/EditScreen.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth/controller/AuthController.dart';
import '../../constants.dart';
import '../../controller/dialogController.dart';

class MyClubPage extends StatefulWidget {

  const MyClubPage({super.key});

  @override
  State<MyClubPage> createState() => _MyClubPageState();
}

class _MyClubPageState extends State<MyClubPage> {
  Authcontroller controller = Get.find<Authcontroller>();
  Dialogcontroller dialogController = Get.find<Dialogcontroller>();
  bool isModifying = false;
  int modifyingIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                                  onPressed: () {
                                    Get.to(Editscreen(club: data));
                                  },
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
        )
    );
  }
}
