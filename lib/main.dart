import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/widgets/auth.dart';
import 'package:movie_app/widgets/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: AppColors.mainGreen),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainGreen,
          selectedItemColor: Colors.white, 
          unselectedItemColor: const Color.fromARGB(255, 49, 82, 99)
        ),
      ),
      routes: {
        '/auth': (context) => Auth(),
        '/main screen': (context) => MainScreen(),
      },
      initialRoute: '/auth',
    );
  }
}
