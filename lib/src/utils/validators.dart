class Validators {
  static String? emailValidator(dynamic value) {
    if (value is! String?) {
      return 'Email value not supported';
    }
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // return null if the input is valid
  }

  static String? passwordValidator(dynamic value) {
    if (value is! String?) {
      return 'Password value not supported';
    }
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null; // return null if the input is valid
  }
}
