import 'package:flutter/material.dart';
import 'package:me/models/mypage_list.dart';
import 'package:velocity_x/velocity_x.dart';

import 'extends_icon_text_card.dart';

class MyPageCustomWidget extends StatelessWidget {
  const MyPageCustomWidget({super.key});



  @override
  Widget build(BuildContext context) {
    List listMypageMenu = ListMypageMenu.listMypageMenu;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Divider(height: 12,color: Colors.grey,),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            List.generate(listMypageMenu.length, (index) =>
            ExtendsIconTextCard(item: listMypageMenu[index],)
            )
          ),
        )
      ],
    );
  }
}
