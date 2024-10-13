part of 'internet_connectivity_bloc.dart';

abstract class InternetConnectivityState {
  const InternetConnectivityState();
}
class InternetInitialState extends InternetConnectivityState {}
class InternetGainedState extends InternetConnectivityState {}
class InternetLostState extends InternetConnectivityState {}
