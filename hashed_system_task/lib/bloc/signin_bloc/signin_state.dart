part of 'signin_bloc.dart';

class SignInState extends Equatable {

  final ApiRequestStatus? apiRequestStatus;
  final UserData? userData;
  final bool? isPref;

  const SignInState({
    this.apiRequestStatus,
    this.userData,
    this.isPref,
  });

  SignInState copyWith({
    ApiRequestStatus? apiRequestStatus,
    UserData? userData,
    bool? isPref,
  }){
    return SignInState(
      apiRequestStatus: apiRequestStatus ?? this.apiRequestStatus,
      userData: userData ?? this.userData,
      isPref: isPref ?? this.isPref,
    );
  }

  @override
  List<Object?> get props => [
    apiRequestStatus,
    userData,
    isPref
  ];
}



