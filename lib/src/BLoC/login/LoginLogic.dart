abstract class LoginLogic {
  Future<String> login(String email, String password);
  Future<String> logout();
}

class LoginExecption implements Exception {}

class SimpleLoginLogic implements LoginLogic {
  @override
  Future<String> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (email != "test@test.com" || password != "123456") {
      throw LoginExecption();
    }

    return "token";
  }

  @override
  Future<String> logout() async {
    return '';
  }
}
