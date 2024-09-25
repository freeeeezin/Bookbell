import 'package:flutter/cupertino.dart';

bool isStringEmpty(String? value){
  return value == null  || value.isEmpty;
}

void submitFormValidate(formKey){
  if(formKey.currentState?.validate() ?? false ){
    // submit();
  }
}


void submit(
   String username,
    String email,
    String password,
    String phnumber
    ){



}

