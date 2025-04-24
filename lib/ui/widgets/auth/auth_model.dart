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
      _errorMessage = 'Fill login and password!';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    int? accountId;
    try {
      sessionId = await _apiClient.auth(username: login, password: password);
      accountId = await _apiClient.getAccountInfo(sessionId);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.Network:
          _errorMessage =
              'Server is not available, check your internet connection!';
          break;
        case ApiClientExceptionType.Auth:
          _errorMessage = 'Incorrect login or password!';
          break;
        case ApiClientExceptionType.Other:
          _errorMessage = 'Error happens, please try again!';
          break;
      }
    }

    _isAuthProgress = false;
    if (_errorMessage != null) {
      notifyListeners();
      return;
    }
    if (sessionId == null || accountId == null) {
      _errorMessage = 'Unidentified error, please repeat your attempt!';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    await _sessionDataProvider.setAccountId(accountId);
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
