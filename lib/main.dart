import 'package:flutter/material.dart';
import 'package:vr_ui/pages/favourite_page.dart';
import 'package:vr_ui/pages/profile_page.dart';
import 'package:vr_ui/pages/share_page.dart';
import 'package:vr_ui/pages/land_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VR UI Design',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreensPage(),
    );
  }
}

class ScreensPage extends StatefulWidget {
  const ScreensPage({Key? key}) : super(key: key);

  @override
  _ScreensPageState createState() => _ScreensPageState();
}

class _ScreensPageState extends State<ScreensPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = const [
      LandPage(),
      SharePage(),
      FavouritePage(),
      ProfilePage(),
    ];

    int _selectedIndex = 0;
    void _onItemClick(int index) {
      setState(() {
        index = _selectedIndex;
        _pages[index];
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemClick,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.send,
              color: Colors.grey,
            ),
            label: 'Send',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Person',
          ),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}
