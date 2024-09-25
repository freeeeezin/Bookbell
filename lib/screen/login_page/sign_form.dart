import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me/screen/login_page/sign_function.dart';

import '../../auth/LoginPlatform.dart';
import '../../constants.dart';
import '../../data/service/userService.dart';
import '../myPage/profile_widget.dart';

class SignForm extends StatelessWidget {
   final String? fieldName;


   SignForm(
      {super.key,
        required this.fieldName,
     });



  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('$fieldName'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: '이름'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '사용자 이름을 입력하세요.';
                  }
                  return null;
                },
                onSaved: (value) {
                   // username = value;
                },
              ),
              Visibility(
                visible: fieldName !=  '이메일 찾기',
                child: TextFormField(
                  decoration: InputDecoration(labelText: '이메일'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력하세요.';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return '올바른 이메일을 입력하세요.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // mail = value;
                  },
                ),
              ) ,
              Visibility(
                visible: fieldName == '회원가입',
                child: TextFormField(
                  decoration: InputDecoration(labelText: '비밀번호'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요.';
                    } else if (value.length < 6) {
                      return '비밀번호는 최소 6자 이상이어야 합니다.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // widget.password = value;
                  },
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '휴대폰 번호'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '휴대폰 번호를 입력하세요.';
                  } else if (value.length < 6) {
                    return '비밀번호는 최소 6자 이상이어야 합니다.';
                  }
                  return null;
                },
                onSaved: (value) {
                  // widget.password = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:(){
                   submitFormValidate(formKey);
                },
                child: Text(
                  '$fieldName',
                  style: TextStyle(color: mTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
