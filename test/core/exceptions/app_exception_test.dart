import 'package:flutter_base/core/exceptions/app_exception.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AppException should return correct string representation', () {
    final AppException exception = AppException(
      'Something went wrong',
      code: 500,
    );

    expect(
      exception.toString(),
      'AppException: Something went wrong (code: 500)',
    );
  });
}
