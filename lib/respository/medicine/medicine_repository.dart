import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pills/respository/medicine/model/medicine.dart';

class MedicineFirebase {
  final cloud_firestore.FirebaseFirestore _firestore;
  final user = FirebaseAuth.instance.currentUser;

  MedicineFirebase({cloud_firestore.FirebaseFirestore firestore})
      : _firestore = firestore ?? cloud_firestore.FirebaseFirestore.instance;

  Future<void> createHouse() async {
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

  Stream<List<Medicine>> medicines() async* {
    String userHouse;
    userHouse =
        await _firestore.collection('users').doc(user.uid).get().then((value) {
      return value.get('house').toString();
    });

    yield* _firestore
        .collection('houses/$userHouse/drugs')
        .snapshots()
        .map((event) {
      return event.docs.map((e) => Medicine.fromSnapshot(e)).toList();
    });
  }

  Future<void> addNewMedicine(Medicine medicine) {
    String userHouse;
    _firestore.collection('users').doc(user.uid).get().then((value) {
      userHouse = value.get('house');
    });
    return _firestore
        .collection('houses/$userHouse/drugs')
        .add(medicine.toMap());
  }

  Future<void> deleteMedicine(Medicine medicine) async {
    String userHouse =
        await _firestore.collection('users').doc(user.uid).get().then((value) {
      return value.get('house');
    });

    return _firestore
        .collection('houses/$userHouse/drugs')
        .doc(medicine.id)
        .delete();
  }
}
