import 'package:flutter/material.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/widgets/main_screen.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthState();
  }
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: AppColors.mainGreen,
        centerTitle: true,
        title: const Text('Movie App'),
      ),
      body: ListView(children: [HeaderWidget()]),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text('Login to your account', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text(
              'In order to use the editing and rating capabilities of Movie App, as well as get personal recommendations you will need to login to your account. if you do not have an account, registering for and account is free and simple. Click below to get started.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(
                  AppColors.mainGreen,
                ),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
              ),
              onPressed: () {},
              child: Text('Create an account'),
            ),
            SizedBox(height: 10),
            Text(
              "If you signed up but didn't get your verification email, click below to have it resent.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(
                  AppColors.mainGreen,
                ),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
              ),
              onPressed: () {},
              child: Text('Verify your email'),
            ),
            SizedBox(height: 25),
            FormWidget(),
          ],
        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FormWidgetState();
  }
}

class _FormWidgetState extends State<FormWidget> {
  final _loginTextController = TextEditingController(text: 'qwerty');
  final _passwordTextController = TextEditingController(text: 'qwerty');
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == 'qwerty' && password == 'qwerty') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed('/main screen');

    } else {
      errorText = 'Login or password is not correct!';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('Reset password');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null)
          Text('$errorText', style: TextStyle(fontSize: 16, color: Colors.red)),
        SizedBox(height: 10),
        Text('Username', style: TextStyle(fontSize: 16)),
        TextField(
          controller: _loginTextController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.mainGreen,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
        Text('Password', style: TextStyle(fontSize: 16)),
        TextField(
          controller: _passwordTextController,
          obscureText: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.mainGreen,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 25),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColors.mainGreen,
                ),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
              ),
              onPressed: _auth,
              child: const Text('Login'),
            ),
            SizedBox(width: 15),
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
              ),
              onPressed: _resetPassword,
              child: Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}
