import 'package:flutter/material.dart';
import 'package:vorkinsta/screens/auth/login_page.dart';
import 'package:vorkinsta/screens/auth/signup_page.dart';
import 'package:vorkinsta/values/app_colors.dart';
import 'package:vorkinsta/values/app_strings.dart';

class RoundedBtn extends StatelessWidget {
  final String name;
  final VoidCallback? callback;
  final int mode;
  const RoundedBtn({Key? key, required this.name, this.callback, this.mode = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.blue,
      onPressed: () {
        if (mode == 0) {
          return;
        }
        if (name == AppStrings.loginText) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignupPage()));
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
