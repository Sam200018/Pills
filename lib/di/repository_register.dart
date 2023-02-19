import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pills/data/authentication/authentication_repository.dart';

final locator = GetIt.instance;

void setupRepositories() {
  locator.registerFactory<GoogleSignIn>(() => GoogleSignIn.standard());
  locator.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerFactory<FirebaseFirestore>(() => FirebaseFirestore.instance);
  locator.registerFactory<AuthenticationRepository>(() =>
      AuthenticationRepository(
          firebaseAuth: locator.get<FirebaseAuth>(),
          firestore: locator.get<FirebaseFirestore>(),
          googleSignIn: locator.get<GoogleSignIn>()));
}
