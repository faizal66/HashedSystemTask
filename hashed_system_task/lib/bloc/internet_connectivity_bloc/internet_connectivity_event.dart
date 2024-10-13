part of 'internet_connectivity_bloc.dart';

class InternetConnectivityEvent {
  const InternetConnectivityEvent();
}
class InternetGainedEvent extends InternetConnectivityEvent {}
class InternetLostEvent extends InternetConnectivityEvent {}
