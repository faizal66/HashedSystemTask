
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request/sign_in_body.dart';
import '../response/main_response.dart';

part 'network_api_client.g.dart';

@RestApi()
abstract class NetworkApiClient{
  factory NetworkApiClient(Dio dio, {String baseUrl}) = _NetworkApiClient;

  /// Auth Endpoint
  @POST('login/')
  Future<MainResponse> signIn(@Body(nullToAbsent: true) SignInBody signInBody);
}