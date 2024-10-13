part of 'main_screen_bloc.dart';

@immutable
class MainScreenEvent{
  final int? currentPage;
  final String? currentTitle;
  MainScreenEvent(this.currentTitle,this.currentPage);
}
