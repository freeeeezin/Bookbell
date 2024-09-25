import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {


  late String collectionPath;

  FirebaseService(this.collectionPath);


  final FirebaseFirestore db = FirebaseFirestore.instance;

}