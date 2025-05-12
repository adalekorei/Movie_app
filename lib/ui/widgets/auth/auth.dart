import 'package:flutter/material.dart';
import 'package:movie_app/ui/theme/app_colors.dart';
import 'package:movie_app/ui/widgets/auth/auth_model.dart';
import 'package:movie_app/ui/widgets/inherited/notifier_provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(
          'Movie App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                foregroundColor: WidgetStatePropertyAll(AppColors.mainColor),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
              ),
              onPressed: () async {
                final url = Uri.parse('https://www.themoviedb.org/signup');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              },
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
                foregroundColor: WidgetStatePropertyAll(AppColors.mainColor),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
              ),
              onPressed: () async {
                final url = Uri.parse(
                  'https://accounts.google.com/v3/signin/identifier?flowEntry=ServiceLogin&flowName=GlifWebSignIn&hl=en-GB&ifkv=ASKV5MgZh-cTWEEOPyfl0y2SvE09680-tBL1XvjF8_np7i8eLbY8WYVH0G3d5k-y3dYEsbI4Qzd1TQ&dsh=S-1842874302%3A1747040911297208',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              },
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

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessage(),
        Text('Username', style: TextStyle(fontSize: 16)),
        TextField(
          controller: model?.loginTextController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainColor),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 15),
        Text('Password', style: TextStyle(fontSize: 16)),
        TextField(
          controller: model?.passwordTextController,
          obscureText: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mainColor),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 25),
        Row(
          children: [
            AuthButton(model: model),
            SizedBox(width: 15),
            TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
              ),
              onPressed: () async {
                final url = Uri.parse(
                  'https://www.themoviedb.org/reset-password',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  print('Something happened, please try again');
                }
              },
              child: Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.model});

  final AuthModel? model;

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canAuth == true ? () => model?.auth(context) : null;
    final child =
        model?.isAuthProgress == true
            ? const SizedBox(
              width: 15,
              height: 15,
              child: SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(),
              ),
            )
            : const Text(
              'Login',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            );
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16)),
      ),
      child: child,
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage();

  @override
  Widget build(BuildContext context) {
    final errorMessage =
        NotifierProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: TextStyle(fontSize: 16, color: Colors.red),
      ),
    );
  }
}
