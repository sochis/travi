import 'package:travi/shared/helpers/common_notifier.dart';
import 'package:travi/core/network/api_result.dart';

typedef FetchFunction<T> = Future<ApiResult<List<T>>> Function();

class ApiResultNotifier<T> extends CommonNotifier<T> {
  final FetchFunction<T> fetchFunction;

  ApiResultNotifier(this.fetchFunction);

  @override
  Future<List<T>> fetchFromRepository() async {
    final result = await fetchFunction();

    if (result is Success<List<T>>) {
      return result.data;
    } else if (result is Failure<List<T>>) {
      throw Exception(result.error.message);
    } else {
      throw Exception('Unknown error');
    }
  }
}
