// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

//DateTime 포맷팅
extension FormatDate on String {
  String formatDate(){
    DateTime datetime = DateTime.parse(this);
    return DateFormat('yyyy.MM.dd').format(datetime);
  }

  String formatDate1(){
    DateTime datetime ;
    datetime = this.toDate()!;
    return DateFormat('yyyy.mm.dd').format(datetime);
  }
}




