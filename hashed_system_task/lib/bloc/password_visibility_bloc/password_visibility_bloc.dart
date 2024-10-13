import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_visibility_event.dart';
part 'password_visibility_state.dart';

class PasswordVisibilityBloc extends Bloc<PasswordVisibilityEvent, PasswordVisibilityState> {
  PasswordVisibilityBloc() : super(const PasswordVisibilityState()) {
    on<PasswordVisibilityEvent>(_passwordVisibilityEvent);
  }
  void _passwordVisibilityEvent(PasswordVisibilityEvent event, Emitter<PasswordVisibilityState> emitter ){
    emit(state.copyWith(isPasswordVisible: event.isPasswordVisible));
  }
}
