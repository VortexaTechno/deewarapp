import 'dart:math';

import 'package:intl/intl.dart';

bool validatePhoneNumber({String? phoneNumber}) {
  // Regular expression pattern to match a valid phone number
  RegExp regex = RegExp(r'^\+?(\d{1,4})?[-. ]?(\d{1,3})[-. ]?(\d{3})[-. ]?(\d{4})$');
  return regex.hasMatch(phoneNumber!);
}

bool validatePassword({required String password}) {
  if (password.length >= 6) {
    return true;
  }
  return false;
}
bool validateName({required String Name}) {
  if (Name.length >= 4) {
    return true;
  }
  return false;
}

String convertDatetimeString(String datetimeString) {
  DateTime datetime = DateTime.parse(datetimeString);
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(datetime);
  return formattedDate;
}




