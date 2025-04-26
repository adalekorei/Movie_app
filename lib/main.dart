import 'package:flutter/material.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:movie_app/ui/widgets/my_app/my_app.dart';
import 'package:movie_app/ui/widgets/my_app/my_app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  const app = MyApp();
  final widget = Provider(model: model, child: app);
  runApp(widget);
}