import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:firebase_auth/firebase_auth.dart';

class MedicineFirebase {
  final cloud_firestore.FirebaseFirestore _firestore;

  MedicineFirebase({cloud_firestore.FirebaseFirestore firestore})
      : _firestore = firestore ?? cloud_firestore.FirebaseFirestore.instance;

  Future<void> createHouse() async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      final house = await _firestore.collection('houses').add({
        'members': [user.uid],
      });

      await _firestore
          .collection('users')
          .doc(user.uid)
          .update({'isInTheHouse': true, 'house': house.id});
    } on cloud_firestore.FirebaseException catch (e) {
      throw e;
    }
  }
}
