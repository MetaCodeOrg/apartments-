import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/about.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/home.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/search.dart';
import 'package:flutter_app/screens/home/navigate_bar_screens/setting.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const AboutPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "البحث",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "معلومات عنا",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "الإعدادات",
            ),
          ],
        ),
      ),
    );
  }
}
