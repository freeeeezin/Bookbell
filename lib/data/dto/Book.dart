import 'package:flutter/material.dart';

class Book  {

  final String title;
  final String author;
  final String imageURL;
  final String isbn;
  final String description;
  final String pubDate;
  bool isLike;

  Book(  { required this.title,  required this.author,
    required this.imageURL, required this.isbn,required this.description, required this.pubDate, this.isLike = false,});

  factory Book.fromMap(Map<String, dynamic> data){
    return Book(
      title: data['title'] ?? 'Unknown Title',
      author: data['author'] ?? 'Unknown Author',
      imageURL: data['image'] ?? 'Unknown ImageURL',
      isbn: data['isbn'] ?? 'Unknown isbn',
      description: data['description'] ?? 'null',
      pubDate: data['pubDate'] ?? '',
      isLike: data['isLike'] ?? false
    );
  }

  // toJson 메서드: Book 객체를 Map으로 변환
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'imageURL': imageURL,
      'isbn': isbn,
      'isLike':isLike
    };
  }

}

