import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/widgets/movie_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  var _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        title: const Text('Movie App'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [Text('News'), MovieList(), Text('Serials')],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Serials'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
