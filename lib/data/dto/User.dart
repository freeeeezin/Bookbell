import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:me/auth/LoginPlatform.dart';

class User {
  String uid;
  String name;
  String email;
  String? phtoURL;
  Loginplatform loginplatform;
  DateTime createdAt;
  Map<String, List<dynamic>>? like_list;
  Map<String, List<dynamic>>? community_list;

  User({
    required this.uid,
    required this.name,
    required this.email,
    this.phtoURL,
    required this.loginplatform,
    DateTime? createdAt,
    this.like_list,
    this.community_list,
  }) : createdAt = createdAt ?? DateTime.now();

  factory User.fromFirestore(Map<String, dynamic> data, String documentId){

    return User(
      uid:  documentId,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      loginplatform: data['loginplatform'] ?? '',
      createdAt:  (data['createdAt'] as Timestamp).toDate(),
      like_list:  data['like_list'] ?? null,
      community_list: data['community'] ?? null,
    );
  }






}
