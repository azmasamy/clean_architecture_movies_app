import 'package:clean_architecture_movies_app/core/exeptions/general_error.dart';

class LocalDatabaseError extends GeneralError {
  final bool success;

  const LocalDatabaseError({
    required message,
    required this.success,
  }) : super(message);

  factory LocalDatabaseError.fromJson(Map<String, dynamic> json) =>
      LocalDatabaseError(
        message: json['status_message'],
        success: json['success'],
      );

  @override
  List<Object?> get props => [success];
}

class LocalDatasourceException implements Exception {
  final LocalDatabaseError errorMessage;

  const LocalDatasourceException(this.errorMessage);
}
