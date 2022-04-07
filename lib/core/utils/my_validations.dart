class MyValidations {
  MyValidations();

  static bool isValidEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  static bool isEmpty(String value) {
    return value.isEmpty;
  }

  static bool isLengthGreaterThan(String value, int length) {
    return value.length > length;
  }
}
