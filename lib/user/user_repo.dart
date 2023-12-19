import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foseja/user/user_entity.dart';

class UserRepo {
  final CollectionReference<Map<String, dynamic>> _userCollection =
      FirebaseFirestore.instance.collection('users');

//create
  Future<void> createUser(UserEntity user) async {
    final doc = await _userCollection.doc(user.uid).get();
    if (doc.data() == null) {
      print('신규 유저 확인, 유저를 생성합니다.');
      await _userCollection.doc(user.uid).set(user.toJson());
    } else {
      print('이미 저장된 유저, 유저 생성을 생략합니다.');
    }
  }

//get
  Future<Map<String, dynamic>?> getUser(String uid) async {
    final doc = await _userCollection.doc(uid).get();
    return doc.data();
  }
//update

//delete
}

final userRepo = Provider(
  (ref) => UserRepo(),
);
