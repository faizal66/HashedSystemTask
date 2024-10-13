import '../request/sign_in_body.dart';
import '../response/main_response.dart';

abstract class DataManagerImp{
  Future<MainResponse> signIn(SignInBody signInBody);
}