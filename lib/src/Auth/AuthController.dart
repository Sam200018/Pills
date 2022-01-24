import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  Future<void> onReady() async {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAllNamed('/home');
    } else {
      Get.offAllNamed('/loginOptions');
    }
  }

  //*cerrar sesion
  Future<void> logOut() async {
    try {
      await _auth.signOut();

      // await Future.wait([
      //   _auth.signOut(),
      //   _googleSignIn.signIn(),
      // ]);
    } catch (e) {}
  }
}
