import 'package:cuberto_bottom_bar/internal/cuberto_bottom_bar.dart';
import 'package:cuberto_bottom_bar/internal/tab_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashed_system_task/bloc/home_screen_bloc/home_screen_bloc.dart';
import 'package:hashed_system_task/bloc/main_screen_bloc/main_screen_bloc.dart';
import 'package:hashed_system_task/screens/category_screen.dart';
import 'package:hashed_system_task/screens/home_screen.dart';
import 'package:hashed_system_task/screens/location_screen.dart';
import 'package:hashed_system_task/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color _inactiveColor = Colors.grey;

  final List<TabData> tabs = [
    const TabData(
      iconData: Icons.home_filled,
      title: "Home",
      tabColor: Colors.white,
      tabGradient: LinearGradient(
        colors: [
          Color(0xff5ACD84), // Start color of the gradient
          Color(0xff56AEFF)// End color of the gradient
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    const TabData(
      iconData: Icons.category,
      title: "Categories",
      tabColor: Colors.white,
      tabGradient: LinearGradient(
        colors: [
          Color(0xff5ACD84), // Start color of the gradient
          Color(0xff56AEFF)// End color of the gradient
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    const TabData(
      iconData: Icons.location_on,
      title: "Location",
      tabColor: Colors.white,
      tabGradient: LinearGradient(
        colors: [
          Color(0xff5ACD84), // Start color of the gradient
          Color(0xff56AEFF)// End color of the gradient
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    const TabData(
      iconData: Icons.person,
      title: "Profile",
      tabColor: Colors.white,
      tabGradient: LinearGradient(
        colors: [
          Color(0xff5ACD84), // Start color of the gradient
          Color(0xff56AEFF)// End color of the gradient
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
  ];
  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
    LocationScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>
      (builder: (context, state){
        return Scaffold(
          body:  IndexedStack(
            index: state.currentPage ?? 0, // Display the current screen
            children: _screens, // Screens corresponding to each tab
          ),
          bottomNavigationBar: CubertoBottomBar(
            key: const Key("BottomBar"),
            inactiveIconColor: _inactiveColor,
            tabStyle: CubertoTabStyle.styleFadedBackground,
            selectedTab: state.currentPage ?? 0,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            tabs: tabs.map(
                  (value) => TabData(
                key: Key(value.title),
                iconData: value.iconData,
                title: value.title,
                tabColor: value.tabColor,
                tabGradient: value.tabGradient,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ).toList(),
            onTabChangedListener: (position, title, color) {
              context.read<MainScreenBloc>().add(
                MainScreenEvent(title, position)
              );
            },
          ),
        );
    });
  }
}
