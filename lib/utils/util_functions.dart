import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ecommerce/src/models.dart';

class UtilFunctions {
  static Future<CustomButtonState> updateButtonState(
    CustomButtonState state,
  ) async {
    return state;
  }

  /// The function converts a list of integers to a list of strings.
  ///
  /// Args:
  ///   data (List<int>): A list of integers that needs to be converted to a list of strings.
  ///
  /// Returns:
  ///   A new list of strings is being returned, where each element in the original list of integers has
  /// been converted to a string using the `toString()` method.
  static List<String> intListToStringList(List<int> data) {
    return data.map((numbers) => numbers.toString()).toList();
  }

  /// The function converts a list of strings to a list of integers in Dart.
  ///
  /// Args:
  ///   data (List<String>): The parameter `data` is a `List` of `String` objects that contains the data
  /// to be converted to a `List` of `int` objects.
  ///
  /// Returns:
  ///   a list of integers obtained by parsing each element of the input list of strings using the
  /// `int.parse` method.
  static List<int> stringListToIntList(List<String> data) {
    return data.map(int.parse).toList();
  }

  static String removeSpaces(String input) {
    return input.replaceAll(' ', '');
  }

  static bool isDouble(double percent) {
    if (percent.compareTo(percent.toInt()) != 0) {
      // If the percent value is a decimal char
      return true;
    } else {
      // If the percent value is oan Integer
      return false;
    }
  }

  /// The function `formatDate` takes a string representation of a date and an optional pattern, and
  /// returns the formatted date according to the specified pattern and date pattern can be modified.
  /// Returns:
  ///   The formatted date string is being returned.
  static String formatDate(String? date, {String pattern = 'dd MMM yyyy'}) {
    if (date != null) {
      final stringDateToDatetime = DateTime.parse(date);
      final formattedDate = DateFormat(pattern).format(stringDateToDatetime);
      return formattedDate;
    } else {
      return '';
    }
  }

  static String formatDateTwo(String? date, {String pattern = 'yyyy-MM-dd'}) {
    if (date != null) {
      final stringDateToDatetime = DateTime.parse(date);
      final formattedDate = DateFormat(pattern).format(stringDateToDatetime);
      return formattedDate;
    } else {
      return '';
    }
  }

  static String formatTime(String? date, {String pattern = 'hh:mm a'}) {
    if (date != null) {
      final stringDateToDatetime = DateTime.parse(date);
      final formattedTime = DateFormat(pattern).format(stringDateToDatetime);
      return formattedTime;
    } else {
      return '';
    }
  }

  static String capitalizeAllWord(String value) {
    var result = value[0].toUpperCase();
    for (var i = 1; i < value.length; i++) {
      if (value[i - 1] == ' ') {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
      }
    }
    return result;
  }

    static int convertFormattedAmount(String value) {
    int result = double.parse( value.split(' ')[1].toString().replaceAll(',', '').toString()).toInt();
    return result;
  }



  static FormattedValue formatDateDifferenceInWords(String startDate , String endDate ) {
    DateTime fromDate = DateTime.parse(startDate);
    DateTime toDate = DateTime.parse(endDate);

    FormattedValue result;
    if (toDate.isBefore(fromDate)) {

      result= FormattedValue(title: 'End date must be after start date', value:  0);
      return result ;
    }

    Duration difference = toDate.difference(fromDate);
    int days = difference.inDays;

    if (days < 31) {
      result= FormattedValue(title:  '$days day${ days >1 ? "s" : ""}left', value:  days);
      return result ;
    } else if (days < 365) {
      int months = (days / 31).floor();
      result= FormattedValue(title: '$months month${ months >1 ? "s" : ""} left', value:  days);
      return result ;
    } else {
      int years = (days / 365).floor();
      result= FormattedValue(title: '$years year${ years >1 ? "s" : ""} left', value:  days);
      return result ;

    }
  }

  static String formatAmount(double amount, {int value = 100000000}) {
    if (amount >= value) {
      return NumberFormat.compact().format(amount);
    } else {
      return NumberFormat('#,##0.00').format(amount);
    }
  }

  static String currency(context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: '\$');
    return format.currencyName.toString();
    // print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    // print("CURRENCY NAME ${format.currencyName}"); // USD
  }

  static String formatNumber(int amount) {
    if (amount >= 10000000) {
      return NumberFormat.compact().format(amount);
    } else {
      return NumberFormat('#,##0').format(amount);
    }
  }


  String convertToCamelCase(String inputString) {
    List<String> words = inputString.split(' ');

    if (words.length > 1) {
      String camelCaseString = words[0].toLowerCase() +
          words
              .sublist(1)
              .map((word) => word[0].toUpperCase() + word.substring(1))
              .join();
      return camelCaseString;
    } else {
      return inputString.toLowerCase();
    }
  }
}

class FormattedValue {
  String title;
  int value;

  FormattedValue({required this.title, required this.value});
}
