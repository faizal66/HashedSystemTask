import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hashed_system_task/network/data_manager/data_manager.dart';

import '../../network/request/sign_in_body.dart';
import '../../network/response/user_data.dart';
import '../../network/service/network_api_client.dart';
import '../../utils/custom_shared_pref.dart';
import '../api_request_status.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.dataManager}) : super(SignInState()) {

    on<SignInDataEvent>(_getAuthDataEvent);
    on<SaveDataInSharedPreferenceEvent>(_saveDataInSharedPreferenceEvent);
    on<GetDataFromSharedPreferenceEvent>(_getDataFromSharedPreferenceEvent);
  }
  final DataManager dataManager;

  Future<void> _getAuthDataEvent(SignInDataEvent event, Emitter<SignInState> emitter ) async {
    emit(state.copyWith(apiRequestStatus: ApiRequestStatusLoading()));
    final signInBody = SignInBody(
      email: event.body.email,
      password: event.body.password,
      device_id: event.body.device_id
    );
    await dataManager
    .signIn(signInBody)
    .then((mainResponse){
      print('Data: ${mainResponse.success}');
      if(mainResponse.success){
        print('Data: ${mainResponse.response?.data}');
        emit(state.copyWith(
          userData: mainResponse.response?.data,
          apiRequestStatus: const ApiRequestStatusSuccess()
        ));
        add(SaveDataInSharedPreferenceEvent('session', mainResponse.response?.data));
      }
      else{
        emit(state.copyWith(apiRequestStatus: ApiRequestStatusFailure(errorMessage: mainResponse.response?.message ?? '')));
      }
    }).catchError((e){
      emit(state.copyWith(apiRequestStatus: const InitialApiRequestStatus()));
    });
  }

  void _saveDataInSharedPreferenceEvent(SaveDataInSharedPreferenceEvent event, Emitter<SignInState> emitter ) async{
    final data = event.value;
    if(data != null) {
      await CustomSharedPreferences.saveCustomData(event.key ?? '', data);
      emit(state.copyWith(isPref: true));
    }
    else{
      emit(state.copyWith(isPref: false));
    }
  }

  void _getDataFromSharedPreferenceEvent(GetDataFromSharedPreferenceEvent event, Emitter<SignInState> emitter ) async{
    final key = event.key;
    if(key != null) {
      final data = await CustomSharedPreferences.getCustomData(key);
      emit(state.copyWith(userData: data));
    }
  }
}
