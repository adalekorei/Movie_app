import 'package:flutter/material.dart';
import 'package:movie_app/ui/theme/app_colors.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/movie_list/movie_list.dart';
import 'package:movie_app/ui/widgets/movie_list/movie_list_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  var _selectedTab = 0;
  final movieListModel = MovieListModel();

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    movieListModel.setupLocal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        title: const Text(
          'Movie App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const Text('News'),
          NotifierProvider(model: movieListModel, child: const MovieList()),
          const Text('TV Shows'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Shows'),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
