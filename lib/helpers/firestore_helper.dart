import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../modal/person.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final String _collectionUser = 'User';
  final String _collectionAllUser = 'All User';

  final String _userEmailId = 'emailId';
  final String _userPassword = 'password';

  addUser({required PersonModal personModal}) {
    Map<String, dynamic> data = {
      _userEmailId: personModal.emailId,
      _userPassword: personModal.password,
    };

    _firebaseFirestore
        .collection(_collectionUser)
        .doc(personModal.emailId)
        .set(data);
  }

  getCredentialPsw({required String emailId}) async {
    DocumentSnapshot documentSnapshot =
        await _firebaseFirestore.collection(_collectionUser).doc(emailId).get();

    Map<String, dynamic> userData =
        documentSnapshot.data() as Map<String, dynamic>;

    return userData['password'];
  }

  getCredentialEmail({required String emailId}) async {
    DocumentSnapshot documentSnapshot =
        await _firebaseFirestore.collection(_collectionUser).doc(emailId).get();

    Map<String, dynamic> userData =
        documentSnapshot.data() as Map<String, dynamic>;

    return userData['emailId'];
  }

  Future<Map<String, dynamic>> getAllUserEmail() async {
    DocumentSnapshot docs = await _firebaseFirestore
        .collection(_collectionAllUser)
        .doc('email')
        .get();

    print("-----------------");
    print(docs.data);
    print("-----------------");

    return docs.data as Future<Map<String, dynamic>>;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getAllUserEmailStream() {
    return _firebaseFirestore
        .collection(_collectionAllUser)
        .doc('email')
        .snapshots();
  }


  addUserEmail() async {}

  Future<Map<String, dynamic>> getUser({required String emailId}) async {
    DocumentSnapshot docs =
        await _firebaseFirestore.collection(_collectionUser).doc(emailId).get();

    return docs.data() as Map<String, dynamic>;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserStream(
      {required String userEmailId}) {
    return _firebaseFirestore
        .collection(_collectionUser)
        .doc(userEmailId)
        .snapshots();
  }
}
