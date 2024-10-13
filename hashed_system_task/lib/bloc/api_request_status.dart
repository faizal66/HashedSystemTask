import 'package:flutter/cupertino.dart';

@immutable
abstract class ApiRequestStatus {
  const ApiRequestStatus();
}

class InitialApiRequestStatus extends ApiRequestStatus {
  const InitialApiRequestStatus();
}

class ApiRequestStatusLoading extends ApiRequestStatus {}

class ApiRequestStatusSuccess extends ApiRequestStatus {
  const ApiRequestStatusSuccess();
}

class ApiRequestStatusFailure extends ApiRequestStatus {
  final int? errorCode;
  final String errorMessage;

  const ApiRequestStatusFailure({this.errorCode, this.errorMessage = ''});
}