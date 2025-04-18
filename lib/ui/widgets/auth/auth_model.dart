import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/data_providers/session_data_provider.dart';
import 'package:movie_app/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  AuthModel() {
    loginTextController.addListener(_onTextChanged);
    passwordTextController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Fill login and password';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
       sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    } catch (e) {
      _errorMessage = 'Incorrect login or password!';
    }

    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }
    if (sessionId == null) {
      _errorMessage = 'Unidentified error, please repeat your attempt';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    Navigator.of(context).pushReplacementNamed(MainNavigationRoutes.mainScreen);
  }

  @override
  void dispose() {
    loginTextController.removeListener(_onTextChanged);
    passwordTextController.removeListener(_onTextChanged);
    loginTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;

  const AuthProvider({Key? key, required Widget child, required this.model})
    : super(key: key, child: child, notifier: model);

  get widget => null;

  static AuthProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
