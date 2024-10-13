import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashed_system_task/bloc/checkbox_bloc/checkbox_bloc.dart';
import 'package:hashed_system_task/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:hashed_system_task/bloc/internet_connectivity_bloc/internet_connectivity_bloc.dart';
import 'package:hashed_system_task/bloc/main_screen_bloc/main_screen_bloc.dart';
import 'package:hashed_system_task/bloc/password_visibility_bloc/password_visibility_bloc.dart';
import 'package:hashed_system_task/bloc/signin_bloc/signin_bloc.dart';
import 'package:hashed_system_task/network/service/network_api_client.dart';
import 'package:hashed_system_task/screens/splash_screen.dart';

import 'network/data_manager/data_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final networkApiClient = NetworkApiClient(Dio(),baseUrl: 'https://api.mr-corp.ca/api/');
    final DataManager dataManager = DataManager(networkApiClient: networkApiClient);
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => SignInBloc(dataManager: dataManager),
      ),
      BlocProvider(
        create: (context) => InternetConnectivityBloc(),
      ),
      BlocProvider(
        create: (context) => PasswordVisibilityBloc(),
      ),
      BlocProvider(
        create: (context) => CheckBoxBloc(),
      ),
      BlocProvider(
        create: (context) => MainScreenBloc()),
      BlocProvider(
        create: (context) => HomeScreenBloc(),
      ),
    ], child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
    )
    );
  }
}
