import 'package:me/models/book_keyword.dart';

class BookClubModel {
  String title;
  String content;
  String creator;
  DateTime createdDate;
  String category;
  bool status;

  BookClubModel(
      {required this.title,
      required this.content,
      required this.creator,
      required this.createdDate,
      required this.category,
      required this.status});


  static List<BookClubModel> clubList = [
    BookClubModel(
        title: "범계 도서 모임 구해요!",
        content: "일주일에 2번 범계역 근처 도서 모임입니다. 연락주세요",
        creator: "김유진",
        createdDate: DateTime.now(),
        category: searchKeyList.first,
        status: true),
    BookClubModel(
        title: "안양역 근처 영어책 모임",
        content: "일주일에 2번 안양역 근처 도서 모임입니다. 연락주세요",
        creator: "정유진",
        createdDate: DateTime.now(),
        category: searchKeyList.first,
        status: true),
    BookClubModel(
        title: "자기계발서 읽고 나누는 모임",
        content: "매일 의왕역 근처 도서 모임입니다. 연락주세요 안녕하세요 안녕하세요 어서 오세요 어서오세요",
        creator: "이유진",
        createdDate: DateTime.now(),
        category: searchKeyList.first,
        status: true)
  ];




}
