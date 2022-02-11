import 'package:flutter/material.dart';
import 'package:vorkinsta/values/app_strings.dart';
import 'package:vorkinsta/widget/base_appbar.dart';

import 'login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
        appBar: AppBar(),
        widgets: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text(
                AppStrings.loginText,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          )
        ],
      ),
      body: Container(),
    );
  }
}
