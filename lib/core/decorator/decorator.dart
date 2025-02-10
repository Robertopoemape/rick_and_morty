import 'package:dio/dio.dart';

import '../errors/errors.dart';

Failure mapDioErrorToFailure(DioException e) {
  Exception exception;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      exception = ConnectTimeOutException();
      break;

    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      exception = ServerException();
      break;

    case DioExceptionType.badResponse:
      String errorMessage = '';
      if (e.response != null && e.response?.data is Map<String, dynamic>) {
        final responseData = e.response?.data;
        errorMessage = responseData["error"];
      }

      exception = InternalServerErrorException(message: errorMessage);
      break;

    case DioExceptionType.cancel:
      exception = ServerCancelException();
      break;

    case DioExceptionType.connectionError:
      exception = ServerOfflineException();
      break;

    default:
      exception = UndefinedException();
      break;
  }

  return mapExceptionToFailure(exception);
}

Failure mapExceptionToFailure(Exception e) {
  if (e is ConnectTimeOutException) {
    return ConnectTimeOutFailure(message: 'Tiempo de espera agotado.');
  } else if (e is ServerException) {
    return ServerFailure(message: 'El servidor tardó demasiado en responder.');
  } else if (e is InternalServerErrorException) {
    return InternalServerErrorFailure(
        message: e.message ?? 'El servidor devolvió una respuesta incorrecta.');
  } else if (e is ServerCancelException) {
    return ServerCancelFailure(message: 'La solicitud fue cancelada.');
  } else if (e is ServerOfflineException) {
    return ServerOfflineFailure(
        message: 'Error de conexión. Verifica tu internet o el servidor.');
  } else {
    return UndefinedFailure(
        message: 'Ha ocurrido un error al obtener los datos.');
  }
}
