class Validators {
  static final RegExp _emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static final RegExp _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  static final RegExp _namesRegExp = RegExp(r"^([A-Z][a-zA-Z]*)");

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    password.contains(password);
    return _passwordRegExp.hasMatch(password);
  }

  static isVerifiedPassword(String orignalPassword, String verifyPassword) {
    return verifyPassword.contains(orignalPassword);
  }

  static isValidNames(String name) => _namesRegExp.hasMatch(name);

  static isValidAmount(double amount) => (amount > 0) ? true : false;
}
