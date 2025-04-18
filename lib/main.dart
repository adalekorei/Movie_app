import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/my_app/my_app.dart';
import 'package:movie_app/ui/widgets/my_app/my_app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  final app = MyApp(model: model);
  runApp(app);
}