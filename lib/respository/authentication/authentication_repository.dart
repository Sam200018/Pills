import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import 'models/user.dart';

class SignUpFailure implements Exception {}

class LogInWithEmailAndPasswordFailure implements Exception {}

class LogInWithGoogleFailure implements Exception {}

class LogOutFailure implements Exception {}

class AuthenticationRepository {
  final GoogleSignIn _googleSignIn;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final cloud_firestore.FirebaseFirestore _firestore;

  AuthenticationRepository(
      {firebase_auth.FirebaseAuth firebaseAuth,
      GoogleSignIn googleSignIn,
      cloud_firestore.FirebaseFirestore firestore})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard(),
        _firestore = firestore ?? cloud_firestore.FirebaseFirestore.instance;

  //*Stream User-> usuario actual cuando el estado de autenticacion cambia
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) =>
        firebaseUser == null ? User.empty : firebaseUser.toUser);
  }

  //*Registrar usuario con email y password
  Future<void> singUpWithEmailAndPassword({
    @required String name,
    @required String lastName,
    @required String email,
    @required String password,
  }) async {
    assert(email != null && password != null);
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(user.user.uid).set({
        'name': name,
        'lastName': lastName,
        'email': email,
      });
    } on Exception {
      throw SignUpFailure();
    }
  }

  //*Login con google
  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _firestore.collection('users').add({
        'name': googleUser.displayName,
        'lastName': googleUser.displayName.split(' ').last,
        'id': googleUser.id,
        'email': googleUser.email,
      });
      await _firebaseAuth.signInWithCredential(credential);
    } on Exception {
      throw LogInWithGoogleFailure();
    }
  }

  //*Login con email y password
  Future<void> loginWithEmailAndPassword(
      {@required String email, @required String password}) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // await;
    } on Exception {
      throw LogInWithEmailAndPasswordFailure();
    }
  }

  //*cerrar sesion
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signIn(),
      ]);
    } on Exception {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, lastName: photoURL);
  }
}
