import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../const/constants.dart';


extension Date on String {
  String getFormatDate() {
    String date = DateFormat('dd-MM-yyyy').format(DateTime.parse(this));
    return date;
  }

  String getFormatDateWithDayName() {
    String date = DateFormat().add_yMMMMEEEEd().format(DateTime.parse(this));
    return date;
  }

  String getFormatTime() {
    String date = DateFormat.jm().format(DateTime.parse(this));
    return date;
  }

  num getAge() {
    final today = DateTime.now();
    final birthDate = DateTime.parse(this);
    int age = today.year - birthDate.year;
    int month = today.month - birthDate.month;
    if (month < 0 || (month == 0 && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  int getYear() {
    final date = DateTime.parse(this);
    return date.year;
  }

  int getMonth() {
    final date = DateTime.parse(this);
    return date.month;
  }

  int getDay() {
    final date = DateTime.parse(this);
    return date.day;
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return Constants.zero.toDouble();
    } else {
      return this!;
    }
  }
}

extension NonNullNum on num? {
  num orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension ValidationExtension on String {
  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isValidPassword() {
    return contains(RegExp(r'\d')) && contains(RegExp(r'[a-zA-Z]'));
  }
}

extension ContextExtension on BuildContext {
  void dismissKeyboard() {
    var focus = FocusManager.instance.primaryFocus;
    if (focus != null) {
      focus.unfocus();
    }
  }
}

extension ImageAssetsExtension on String {
  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      this,
      bundle: bundle,
      package: package,
    );
  }
}

extension StringExtension on String {
  bool containsNumber() {
    // Regular expression to check if the string contains any digit
    return RegExp(r'\d').hasMatch(this);
  }
}

