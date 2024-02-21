import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_snack/view/home.dart';
import 'package:news_snack/view/widget/app_settings.dart';

import 'homepage.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeindex = 0;

  final List<Widget> _pages =[
    const Home_Page(),
    const ExplorePage(),
    const SettingPage(),
  ];

  Widget showScreens(int index){
    return _pages[index];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: showScreens(activeindex),
      bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home,color: Colors.deepPurpleAccent,),
              icon: Icon(Icons.home_outlined,color: Colors.grey,),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.news_solid,color: Colors.deepPurpleAccent,),
              icon: Icon(CupertinoIcons.news,color: Colors.grey,),
              label: 'Explore',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings,color: Colors.deepPurpleAccent,),
              icon: Icon(Icons.settings_outlined,color: Colors.grey,),
              label: 'Setting',
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              activeindex = index;
            });
          },
          indicatorColor: Colors.transparent,
          height: size.height/14,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          elevation: 1,
          backgroundColor: Colors.white,
          selectedIndex: activeindex),
    );
  }
}
