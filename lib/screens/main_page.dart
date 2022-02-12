import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vorkinsta/api/google_signin_api.dart';
import 'package:vorkinsta/screens/home_page.dart';
import 'package:vorkinsta/widget/base_appbar.dart';

class MainPage extends StatelessWidget {
  final GoogleSignInAccount? currentUser;
  const MainPage({Key? key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
        appBar: AppBar(),
        widgets: getAuthAppBar(context),
      ),
      body: Center(
        child: Column(
          children: [const Text("Hello"), Text(currentUser?.displayName ?? '')],
        ),
      ),
    );
  }

  getAuthAppBar(context) {
    return [
      TextButton(
          onPressed: () async {
            await GoogleSignInApi.logout();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          ))
    ];
  }
}
