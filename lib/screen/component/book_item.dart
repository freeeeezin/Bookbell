import 'package:flutter/material.dart';
import 'package:me/models/book_rank.dart';


class BookItem extends StatelessWidget {
  final bool? lineChange;
  final double? textContainerHeight;
  final RankList rankList;

  const BookItem({super.key, this.lineChange = false, this.textContainerHeight, required this.rankList,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 3,
          child: Container(
            height: textContainerHeight,
            width: double.infinity,
            child: Image.asset(rankList.imageUrl),
          ),
        ),
      ],
    );
  }
}


