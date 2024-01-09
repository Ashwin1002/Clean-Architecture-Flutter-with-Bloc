import 'package:flutter/foundation.dart';
import 'package:medhavi_app/core/utils/extensions/string_extensions.dart';

String parseErrorMapToString<T>(T error) {
  List<String> errText = [];

  try {
    debugPrint(
        '+++++++++++++++++\nerror parser => \n\n\n$error\n++++++++++++++++++');

    if (error is Map<String, dynamic>) {
      error.forEach((key, value) {
        if (key.contains('detail')) {
          errText.add(error['detail']);
        } else if (key.contains('non_field_errors')) {
          if (value is List<dynamic>) {
            final temp = value.cast<String>();
            var errList = <String>[];
            for (var err in temp) {
              if (err.contains('unique set')) {
                errList.add(
                    '${err.split(',').firstWhere((element) => element.contains('_')).replaceAll('The fields', '').replaceAll('_', ' ').capitalize()} is already present');
              } else {
                errList.add(err);
              }
            }
            final errorMessages = errList.cast<String>().join(' & ');
            errText.add(errorMessages);
          }
        } else if (value is List<dynamic>) {
          final temp = value.cast<String>();
          var errList = <String>[];
          for (var err in temp) {
            if (err.contains('null') || err.contains('blank')) {
              errList
                  .add('${key.replaceAll('_', ' ').capitalize()} is required');
            } else if (err.contains('unique')) {
              errList.add('$key is already present');
            } else {
              errList.add(err);
            }
          }

          final errorMessages = errList.join(' & ');

          errText.add(errorMessages);
        }
      });
    } else {
      errText = ['Unknown error occurred'];
    }
  } catch (e) {
    errText = kDebugMode
        ? ['Error decoding error message: $e']
        : ['Unknown error occurred'];
  }

  return errText.join(' & ');
}
