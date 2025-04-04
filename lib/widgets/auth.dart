import 'package:flutter/material.dart';

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
        backgroundColor: const Color.fromARGB(90, 82, 175, 102),
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
              'In order to use the editing and rating capabilities of Movie App, as well as get personal recommendations you will need to login to your account. if you do not have an account, registering for and account is free and simple. Click here to get started.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "If you signed up but didn't get your verification email, click here to have it resent.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 45),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Username', style: TextStyle(fontSize: 16)),
        TextField(decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 5,), border: OutlineInputBorder()), ),
        SizedBox(height: 15),
        Text('Password', style: TextStyle(fontSize: 16)),
        TextField(decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 5,), border: OutlineInputBorder()),)
      ],
    );
  }
}
