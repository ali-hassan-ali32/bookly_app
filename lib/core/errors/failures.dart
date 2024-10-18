import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException({required DioException dioException}) {
    switch(dioException.type){
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Bad Internet Connection!');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'The Send Has Take To Long!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'The Receive Has Take To Long!');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad Certificate,Try Later');
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(dioException.response!.statusCode,dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'The Request Has Canceld!');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'Bad Internet Connection!, Try Later');
      case DioExceptionType.unknown:
          if (dioException.message!.contains('SocketException')) {
            return ServerFailure(errorMessage: 'No Internet Connection!');
          } else {
            return ServerFailure(errorMessage: 'UnExpected Error, Try Again');
          }
      default:
        return ServerFailure(errorMessage: 'Opps There was an Error');
    }
  }

  factory ServerFailure.fromBadResponse(int? statsCode, dynamic response) {
    if(statsCode == 400 || statsCode == 401 || statsCode == 403) {
      return ServerFailure(errorMessage: response['error']['message']);
    } else if(statsCode == 404) {
      return ServerFailure(errorMessage: 'Your Requset not Found');
    } else if(statsCode == 500) {
      return ServerFailure(errorMessage: 'Internal Server Error, Try Later!');
    } else {
      return ServerFailure(errorMessage: 'Opps there was an  Error');
    }
  }
}