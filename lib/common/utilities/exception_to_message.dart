import 'dart:io';

import 'package:insight/common/constants/app_strings.dart';

String exceptionToMessage(Object exception) {
  return switch (exception) {
    SocketException => AppStrings.noInternetConnection,
    _ => AppStrings.somethingWrong,
  };
}
