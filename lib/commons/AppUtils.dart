import 'package:validate/validate.dart';

class AppUtils {
  static String validateName(String value) {
    if (value.length < 1) {
      return 'You must enter a valid name';
    }
    return null;
  }

  static String validateEmail(String value) {
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }
    return null;
  }

  static String validateConfirmPassword(confirmPasswordValue, passwordValue) {
    if (confirmPasswordValue.length < 8) {
      return 'The Password must be at least 8 characters.';
    }
    if (confirmPasswordValue != passwordValue) {
      return 'The Passwords should match';
    }
    return null;
  }
}
