abstract class SignUpLogic {
  Future<String> signUp(
      String name, String lastName, String email, String password);
  Future<String> delete();
}

class SignUpException implements Exception {}

class SimpleSignUpLogic implements SignUpLogic {
  @override
  Future<String> signUp(
      String name, String lastName, String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (email == "test@test.com") {
      throw SignUpException();
    }

    return "token";
  }

  @override
  Future<String> delete() async {
    return '';
  }
}
