abstract class Validator {
  static String? phoneValidation(String? phone) {
    if (phone!.isEmpty) {
      return "empty phone";
    }
    final phoneRegex = RegExp(r'^09[0-9]{8}$');
    if (!phoneRegex.hasMatch(phone)) return "invalid phone";
    return null;
  }

  static String? emailValidation(String? email) {
    email = email?.trim();
    bool valid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email!);
    return valid == false ? "invalid email" : null;
  }

  static String? notNullValidation(String? str) =>
      (str == null || str == '') ? "required field" : null;

  static String? notNullValidationValue(String? str) =>
      (str == null || str == '') ? '' : null;

  static String? validateCode(String? value) {
    if (value == null || value == '') {
      return '';
    } else {
      return null;
    }
  }

  static String? validatePass(String? value) {
    RegExp regexUpperCase = RegExp(r'(?=.*[A-Z])');
    RegExp regexLowerCase = RegExp(r'(?=.*[a-z])');
    RegExp regexDigit = RegExp(r'(?=.*[0-9])');
    RegExp regexSpecialCharacter = RegExp(r'(?=.*[!@#$&*~])');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regexLowerCase.hasMatch(value)) {
        return 'regexLowerCase';
      }
      if (!regexUpperCase.hasMatch(value)) {
        return 'regexUpperCase';
      }
      if (!regexDigit.hasMatch(value)) {
        return 'must have a number';
      }
      if (!regexSpecialCharacter.hasMatch(value)) {
        return 'regexSpecialCharacter';
      }
      if (value.length < 10) {
        return "must be more than 10";
      }
    }
    return null;
  }
}
