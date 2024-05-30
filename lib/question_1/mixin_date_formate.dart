// ignore_for_file: avoid_print

import 'package:intl/intl.dart';

mixin DateHelper {
  // helper method to view the date the right way
  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('d-MMM, yyyy');
    return formatter.format(date);
  }

  void toLocalTime(String utcDateString) {
    DateTime utcDatetime = DateTime.parse(utcDateString);
    print("in utc: $utcDatetime");
    // Step 2: Convert the UTC DateTime object to the local timezone
    DateTime localDatetime = utcDatetime.toLocal();
    print("in local: $localDatetime");
  }
}
