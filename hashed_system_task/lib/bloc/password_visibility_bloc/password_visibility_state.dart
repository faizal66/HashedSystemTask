part of 'password_visibility_bloc.dart';

class PasswordVisibilityState extends Equatable {

  final bool? isPasswordVisible;

  const PasswordVisibilityState({
    this.isPasswordVisible,
  });

  PasswordVisibilityState copyWith({
    bool? isPasswordVisible,
  }){
    return PasswordVisibilityState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [isPasswordVisible];
}



