import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hashed_system_task/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:meta/meta.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(const MainScreenState()) {
    on<MainScreenEvent>(_mainScreenEvent);
  }
  void _mainScreenEvent(MainScreenEvent event, Emitter<MainScreenState> emitter ){
    emit(state.copyWith(currentPage: event.currentPage,currentTitle: event.currentTitle));
  }
}
