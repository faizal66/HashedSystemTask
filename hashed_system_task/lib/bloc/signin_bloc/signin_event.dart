part of 'signin_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInDataEvent extends SignInEvent{
  final SignInBody body;

  SignInDataEvent(this.body);
}
class SaveDataInSharedPreferenceEvent extends SignInEvent{
  final String? key;
  final UserData? value;

  SaveDataInSharedPreferenceEvent(this.key, this.value);
}
class GetDataFromSharedPreferenceEvent extends SignInEvent {
  final String? key;

  GetDataFromSharedPreferenceEvent(this.key);
}
