import 'package:flutter/material.dart';

class LikePage extends StatefulWidget {

 LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  final List<String> items = List.generate(10, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'Item $index');
    return SingleChildScrollView(
      child:Container(
        // height: 20,
        // color: Colors.red,
        // child: ListView.builder(
        //     physics: NeverScrollableScrollPhysics(), // Prevent ListView from scrolling
        //     shrinkWrap: true, // Ensures the ListView takes up the minimal necessary height
        //     itemCount: items.length,
        //     itemBuilder: (context,index){
        //   return ListTile(title: Text(items[index]),);
        // })
      )


    );
  }
}
