import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsActions extends StatelessWidget {
  const IconsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 38,
          child: IconButton(onPressed: () {  },
            icon: SvgPicture.asset('assets/icons/user.svg'),
          ),
        ),
        SizedBox(
          width: 38,
          child: IconButton(onPressed: () {  },
            icon: Icon(Icons.settings_suggest_outlined),),
        )

      ],
    );
  }
}
