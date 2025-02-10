import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

//!* Main Failure of the Application
class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class LocalFailure extends Failure {
  const LocalFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class CredentialFailure extends Failure {
  const CredentialFailure({required super.message});
}

class ErrorParametersFailure extends Failure {
  const ErrorParametersFailure({required super.message});
}

class ServerCancelFailure extends Failure {
  const ServerCancelFailure({required super.message});
}

class OthersFailure extends Failure {
  const OthersFailure({required super.message});
}

class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure({required super.message});
}

class ConnectTimeOutFailure extends Failure {
  const ConnectTimeOutFailure({required super.message});
}

class UndefinedFailure extends Failure {
  const UndefinedFailure({required super.message});
}

class InternalServerErrorFailure extends Failure {
  const InternalServerErrorFailure({required super.message});
}

class ServerOfflineFailure extends Failure {
  const ServerOfflineFailure({required super.message});
}
