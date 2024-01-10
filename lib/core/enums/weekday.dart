import 'package:intl/intl.dart';
import 'package:medhavi_app/core/utils/extensions/string_extensions.dart';

enum Weekday {
  sunday(1, 'SUN'),
  monday(2, 'MON'),
  tuesday(3, 'TUE'),
  wednesday(4, 'WED'),
  thursday(5, 'THU'),
  friday(6, 'FRI'),
  saturday(7, 'SAT');

  const Weekday(this.value, this.shortName);

  final int value;
  final String shortName;

  static Weekday get today =>
      fromShortName(DateFormat('EEE').format(DateTime.now()).toUpperCase());

  static Weekday fromValue(int value) =>
      Weekday.values.firstWhere((e) => e.value == value, orElse: () => today);

  static Weekday fromName(String name) =>
      Weekday.values.firstWhere((e) => e.name == name, orElse: () => today);

  static Weekday fromShortName(String shortName) => Weekday.values
      .firstWhere((e) => e.shortName == shortName, orElse: () => today);

  String get name => toString().split('.').last.capitalize();
}
