import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:me/auth/LoginPlatform.dart';

import 'package:me/constants.dart';

import 'package:me/data/service/userService.dart';
import 'package:me/screen/login_page/sign_form.dart';

import 'package:me/screen/myPage/profile_widget.dart';

import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../auth/controller/AuthController.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Authcontroller controller = Get.find<Authcontroller>();
    return Scaffold(
      backgroundColor: mBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 80,
          ),
          Center(
              child: Image.asset(
            'assets/image/bk.png',
            width: 200,
            height: 150,
            color: mTextColor,
          )),
          SizedBox(
            height: 20,
          ),
          '로그인'.text.size(20).color(Colors.black).make(),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'assets/image/g_logo.png',
                        width: 60,
                      ),
                      onTap: () {
                        controller.Login('google');
                        // Get.find<Authcontroller>().Login(Loginplatform.google);
                        // controller.registerWithSNS('google');
                      },
                    ),
                    InkWell(
                        child: Image.asset('assets/image/n_logo.png', width: 60,),
                        onTap: () {
                          controller.Login('naver');
                        }),
                    InkWell(
                        child: Image.asset('assets/image/k_logo.png', width: 60),
                        onTap: () {
                          controller.Login('kakao');
                        }),
                  ],
                  // Image.asset('assets/image/google_logo.png',)
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     InkWell(onTap: () {
          //      Get.to(SignForm(fieldName: '이메일 찾기'));
          //     }, child: Text('이메일 찾기   |   ')),
          //     InkWell(onTap: () {
          //       Get.to(SignForm(fieldName: '비밀번호 찾기'));
          //     }, child: Text(' 비밀번호 찾기   |  ')),
          //     InkWell(
          //         onTap: () {
          //           Get.to(_SignForm());
          //         },
          //         child: Text(
          //           '  회원가입',
          //           style: TextStyle(color: mTextColor),
          //         ))
          //   ],
          // )
        ]),
      ),
    );
  }
}
