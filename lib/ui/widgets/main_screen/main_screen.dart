import 'package:flutter/material.dart';
import 'package:movie_app/ui/theme/app_colors.dart';
import 'package:movie_app/ui/widgets/homepage_tab/homepage.dart';

import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_list/movie_list.dart';
import 'package:movie_app/ui/widgets/movies_tab/movie_list/movie_list_model.dart';
import 'package:movie_app/ui/widgets/tv_shows_tab/tv_shows.dart';
import 'package:movie_app/ui/widgets/tv_shows_tab/tv_shows_model.dart';

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
  final tvShowModel = TvShowsModel();

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    super.initState();

    tvShowModel.loadTvShows();
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
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(
          'Movie App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('auth');
            },
            icon: Icon(Icons.logout),
            alignment: AlignmentDirectional.topStart,
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Homepage(),
          NotifierProvider(
            create: () => movieListModel,
            isModelManaged: false,
            child: const MovieList(),
          ),
          NotifierProvider(
            create: () => tvShowModel,
            isModelManaged: false,
            child: const TvShows(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Shows'),
        ],
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(255, 148, 148, 148),
        onTap: onSelectTab,
      ),
    );
  }
}
