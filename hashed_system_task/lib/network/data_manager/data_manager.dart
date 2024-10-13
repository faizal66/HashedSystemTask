
import 'package:dio/dio.dart';
import 'package:hashed_system_task/network/response/response_data.dart';
import 'package:hashed_system_task/network/service/network_api_client.dart';

import '../request/sign_in_body.dart';
import '../response/main_response.dart';
import 'data_manager_imp.dart';

class DataManager extends DataManagerImp {
  late final NetworkApiClient _networkApiClient;

  DataManager({
    required NetworkApiClient networkApiClient
  }) {
    _networkApiClient = networkApiClient;
  }

  @override
  Future<MainResponse> signIn(SignInBody signInBody) {
    return _networkApiClient
        .signIn(signInBody)
        .then((successResponse) => successResponse)
        .catchError((e) => _returnRunTimeTypeError(e));
  }

  MainResponse _returnRunTimeTypeError(e) {
    switch (e.runtimeType) {
      case DioError:
        return _errorHandling(e);
      default:
        return MainResponse(
            success: false, response: ResponseData(message: e.toString()));
    }
  }

  MainResponse _errorHandling(DioError e) {
    final errorResponse = e.response;
    if (errorResponse?.data != null) {
      var jsonResponse = MainResponse.fromJson(errorResponse?.data);
      return MainResponse(
        success: false,
          response: ResponseData(
              message: jsonResponse.response?.message));
    } else {
      return MainResponse(
          response: ResponseData(
              message: ''),
          success: false);
    }
  }
}