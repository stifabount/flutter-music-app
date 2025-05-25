import 'package:flutter/material.dart';
import 'pages/all_music_page.dart';
import 'pages/playlist_page.dart';


void main() {
  runApp(MyMusicApp());
}

class MyMusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Music Manager',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final pages = [AllMusicPage(), PlaylistPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "All Music"),
          BottomNavigationBarItem(icon: Icon(Icons.playlist_play), label: "Playlist"),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}