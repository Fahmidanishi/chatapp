import 'package:chatapp/features/ui/group_chat.dart';
import 'package:chatapp/features/ui/home_page.dart';
import 'package:chatapp/features/ui/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomePage(),
    GroupChat(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int value) {
            _selectedIndex = value;
            setState(() {});
          },
          elevation: 0,
          selectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2_fill), label: 'Chat'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.group_solid), label: 'Group'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: 'Setting'),
          ]),
    );
  }
}
