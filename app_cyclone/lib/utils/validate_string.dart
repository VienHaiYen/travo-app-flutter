class ValidateRegex {
  static String? isEmail(String email) {
    String message = "Please enter a valid email address.";
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)
        ? null
        : message;
  }

  static String? isPassword(String password) {
    String message = "Password must be at least 6 characters long.";
    return password.length >= 6 ? null : message;
  }

  static String? isPhoneNumber(String phoneNumber) {
    String message = "Please enter a valid phone number.";
    return RegExp(r"^[0-9]{10}$").hasMatch(phoneNumber) ? null : message;
  }

  static String? isName(String name) {
    String message = "Please enter a valid name.";
    return RegExp(r"^[a-zA-Z ]+$").hasMatch(name) ? null : message;
  }
}
