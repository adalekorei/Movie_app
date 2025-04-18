import 'package:flutter/material.dart';
import 'package:movie_app/ui/theme/app_colors.dart';
import 'package:movie_app/ui/widgets/auth/auth.dart';
import 'package:movie_app/ui/widgets/auth/auth_model.dart';
import 'package:movie_app/ui/widgets/main_screen/main_screen.dart';
import 'package:movie_app/ui/widgets/movie_details/movie_details.dart';

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
          unselectedItemColor: const Color.fromARGB(255, 49, 82, 99),
        ),
      ),
      routes: {
        '/auth': (context) => AuthProvider(model: AuthModel(), child: Auth()),
        '/main_screen': (context) => MainScreen(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetails(movieId: arguments);
          } else {
            return MovieDetails(movieId: 0);
          }
        },
      },
      initialRoute: '/auth',
    );
  }
}
