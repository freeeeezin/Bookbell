import 'package:flutter/material.dart';
import 'package:me/constants.dart';
import 'buildTextButton.dart';

class RowIconBar extends StatelessWidget {
  // const RowIconBar({
  //   super.key,
  //   required this.title,
  //   this.icon,
  //   this.widgets,
  //
  //
  // });


  final List<String> title;
  final List<Widget>? widgets;

  const RowIconBar({super.key, required this.title, this.widgets});



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: title.length,
        child: Scaffold(
            backgroundColor: mBackgroundColor,
            appBar: AppBar(
              backgroundColor: mBackgroundColor,
              bottom: TabBar(
                  indicator: BoxDecoration(),
                  tabs: List.generate(
                      title.length,
                      (index) => Buildtextbutton(title: title[index], )
                  )),
            ),
            // body: TabBarView(children: Text('he'))

        ));
  }
}
