part of 'main_screen_bloc.dart';

@immutable
class MainScreenState extends Equatable {

  final int? currentPage;
  final String? currentTitle;

  const MainScreenState({
    this.currentPage,
    this.currentTitle
  });

  MainScreenState copyWith({
     int? currentPage,
     String? currentTitle
  }){
    return MainScreenState(
      currentPage: currentPage ?? this.currentPage,
      currentTitle: currentTitle ?? this.currentTitle,

    );
  }

  @override
  List<Object?> get props => [
    currentPage,
    currentTitle];
}

