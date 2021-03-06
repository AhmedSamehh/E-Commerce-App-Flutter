import 'package:ECommerce/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUser{
  final CollectionReference _userCollectionReference =
    FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirestore( UserModel user) async{
    return await _userCollectionReference.doc(user.userId)
        .set(user.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async{
    return await _userCollectionReference.doc(uid).get();
  }
}