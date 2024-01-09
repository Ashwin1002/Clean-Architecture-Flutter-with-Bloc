import 'package:intl/intl.dart';

final _nepFormatter = NumberFormat.simpleCurrency(
    decimalDigits: 0, name: 'Rs. ', locale: 'hi-IN');

extension StringExt on String {
  /// first letter capitalize
  String capitalize() => trim().isEmpty
      ? ''
      : trim().substring(0, 1).toUpperCase() + trim().substring(1);

  /// format currency to current date
  String toNepaliCurrency() => _nepFormatter.format(trim());

  /// get time ago from current date
  String toTimeAgo(DateTime? dateTime) {
    final dt = dateTime ?? DateTime.now();
    Duration diff = DateTime.now().difference(dt);

    if (diff.inDays >= 1) {
      return '${diff.inDays} day(s) ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hour(s) ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} minute(s) ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} second(s) ago';
    } else {
      return 'just now';
    }
  }

  /// covert date time to hours
  String toHourMinuteFormat(DateTime dateTime, {String format = 'hh:mma'}) {
    try {
      final dateFormat = DateFormat(format);
      return dateFormat.format(dateTime).toLowerCase();
    } catch (_) {
      return '';
    }
  }

  ///custom date format
  String formatDateTime(
    DateTime datetime, {
    String format = 'dd/MM/yyyy hh:mm a',
  }) =>
      DateFormat(format).format(datetime);
}
