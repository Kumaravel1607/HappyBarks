import 'package:intl/intl.dart';

class FormatedDateTime {
  static String formatedDateTime(String dateString,
      {required String inputFormat, required String outputFormat}) {
    if ((dateString == '') || (dateString == 'undefined')) {
      return '';
    }
    var inputFormatDateFormat = DateFormat(inputFormat).parse(dateString, true);
    var outputFormatDateFormat = DateFormat(outputFormat);

    return outputFormatDateFormat.format(inputFormatDateFormat); // 2019-08-18
  }

  static String formatedDateTimeWithoutTimeZone(String dateString,
      {required String inputFormat, required String outputFormat}) {
    if ((dateString == '') || (dateString == 'undefined')) {
      return '';
    }
    var inputFormatDateFormat = DateFormat(inputFormat);
    var outputFormatDateFormat = DateFormat(outputFormat);
    return outputFormatDateFormat
        .format(inputFormatDateFormat.parse(dateString));
  }

  static String formatedTime(String dateString) {
    if (dateString == '') {
      return '';
    }
    DateTime date = DateTime.parse(dateString).toLocal();
    String formatTime(DateTime date) => DateFormat("hh:mma").format(date);
    return formatTime(date);
  }
}
