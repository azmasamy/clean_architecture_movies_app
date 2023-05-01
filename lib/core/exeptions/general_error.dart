import 'package:equatable/equatable.dart';

class GeneralError extends Equatable {
  final String message;

  const GeneralError(this.message);

  @override
  List<Object?> get props => [message];
}