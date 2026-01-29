import 'package:dio/dio.dart';
import '../network/status_code.dart';

String handleDioError(DioException e) {
  if (e.response == null) {
    return 'Internet ocnnection is not present';
  }

  final status =
      HttpStatusCode.fromCode(e.response?.statusCode);

  switch (status) {
    case HttpStatusCode.badRequest:
      return 'Bad request';

    case HttpStatusCode.unauthorized:
      return 'Unauthorized access';

    case HttpStatusCode.forbidden:
      return 'Access forbidden';

    case HttpStatusCode.notFound:
      return 'Data not found';

    case HttpStatusCode.conflict:
      return 'Conflict occurred';

    case HttpStatusCode.internalServerError:
      return 'Server error';

    case HttpStatusCode.badGateway:
      return 'Bad gateway';

    case HttpStatusCode.serviceUnavailable:
      return 'Service unavailable';

    case HttpStatusCode.gatewayTimeout:
      return 'Gateway timeout';

    default:
      return 'Something went wrong';
  }
}
