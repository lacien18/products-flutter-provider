
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:products/core/error/error_message.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure implements _$Failure {
const Failure._();
const factory Failure.custom(String message) = _Custom;
const factory Failure.network() = _Network;
const factory Failure.unexpected() = _Unexpected;
const factory Failure.unauthorized(String message) = _Unauthorized;
const factory Failure.internalServerError() = _InternalServerError;
  const factory Failure.invalidServerResponse() = _InvalidServerResponse;


String get message => when(
 custom: (msg) => msg,
 network: () => ErrorMessages.network,
 unexpected: () => ErrorMessages.general,
 unauthorized: (msg) => msg,
 internalServerError: () => ErrorMessages.internalServerError,
invalidServerResponse: () => ErrorMessages.invalidServerResponse,
 );
}