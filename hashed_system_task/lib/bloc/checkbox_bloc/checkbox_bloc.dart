import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkbox_event.dart';
part 'checkbox_state.dart';

class CheckBoxBloc extends Bloc<CheckBoxEvent, CheckBoxState> {
  CheckBoxBloc() : super(const CheckBoxState()) {
    on<CheckBoxEvent>(_checkboxEvent);
  }
  void _checkboxEvent(CheckBoxEvent event, Emitter<CheckBoxState> emitter ){
    emit(state.copyWith(isChecked: event.isChecked));
  }
}
