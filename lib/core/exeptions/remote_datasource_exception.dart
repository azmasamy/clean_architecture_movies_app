import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';

class RemoteDatasourceError extends GeneralError {
  final int code;
  final bool success;

  const RemoteDatasourceError({
    required message,
    required this.code,
    required this.success,
  }) : super(message);

  factory RemoteDatasourceError.fromJson(Map<String, dynamic> json) =>
      RemoteDatasourceError(
        message: json['status_message'],
        code: json['status_code'],
        success: json['success'],
      );

  @override
  List<Object?> get props => [code, success];
}

class RemoteDatasourceException implements Exception {
  final RemoteDatasourceError remoteDatasourceError;

  const RemoteDatasourceException(this.remoteDatasourceError);
}
