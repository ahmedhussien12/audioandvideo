class InputValidator {
  static final phoneNumberRegEx = RegExp(r"01[0-2]\d{1,8}");
  static final passwordRegEx = RegExp(
      r"(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*");

  static String? password(String? value) {
    if (value!.trim().isEmpty) {
      return ("password must be contain at least eight character");
    } else if (!passwordRegEx.hasMatch(value)) {
      return """contains at least eight characters,
including at least one number and
includes both lower and uppercase letters and
include at least one special characters, #, ?, !.
cannot be your old password""";
    }
    return null;
  }

  static String? phone(String? value) {
    if (value!.trim().isEmpty) {
      return ("Phone Number must be Not Empty");
    } else if (!phoneNumberRegEx.hasMatch(value)) {
      return "Invalid Phone Number";
    }
    return null;
  }

  static String? normalInput(String title, String? value,
      {required int? length}) {
    if (value!.trim().isEmpty) {
      return ("$title must be Not Empty");
    } else if (value.length < length!) {
      return ("$title Must Be at least $length character");
    }
    return null;
  }
}
