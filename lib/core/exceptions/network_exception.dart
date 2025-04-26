import 'package:flutter_base/core/exceptions/app_exception.dart';

class NetworkException extends AppException {
  NetworkException(super.message, {super.code});
}
