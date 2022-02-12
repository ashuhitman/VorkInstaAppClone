import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vorkinsta/api/google_signin_api.dart';
import 'package:vorkinsta/screens/auth/signup_page.dart';
import 'package:vorkinsta/screens/main_page.dart';
import 'package:vorkinsta/values/app_colors.dart';
import 'package:vorkinsta/values/app_strings.dart';
import 'package:vorkinsta/widget/base_appbar.dart';
import 'package:vorkinsta/widget/rounded_btn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignInAccount? _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignInApi.googleSignIn;

  @override
  void initState() {
    super.initState();
    // listen to auth state changes
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 32),
            child: Text(
              AppStrings.loginText + ":",
              style:
                  TextStyle(color: AppColors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            "New to Vorkinsta? click Register",
            style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.normal,
                fontSize: 10),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Text(
              "Sign with Google",
              style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          InkWell(
            onTap: () async {
              print("signing in...");
              await signIn();
            },
            child: Ink(
              color: Colors.white,
              child: Container(
                decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.20))
                ], color: Colors.white),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: Image(image: AssetImage("assets/google.png"))),
                      SizedBox(width: 30),
                      Text(
                        'Sign in',
                        style: TextStyle(
                            color: AppColors.sbBtnColor, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32, right: 32, top: 16),
            child: Text(
              "Sign in with username and password",
              style: TextStyle(
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              child: const TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: "username or email",
                  hintStyle: TextStyle(
                    color: AppColors.blue,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              child: const TextField(
                keyboardType: TextInputType.visiblePassword,
                style: TextStyle(fontSize: 12),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppColors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hintText: "password",
                  hintStyle: TextStyle(color: AppColors.blue),
                ),
              ),
            ),
          ),
          const Text(
            "Forgot Password? click Reset Password",
            style: TextStyle(
                color: AppColors.blue,
                fontWeight: FontWeight.normal,
                fontSize: 10),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const RoundedBtn(
                  name: AppStrings.loginText,
                  mode: 0,
                )),
          ),
        ],
      ),
    );
  }

  signIn() async {
    print("logging...");
    try {
      GoogleSignInAccount? currentUser = await GoogleSignInApi.login();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MainPage(
                    currentUser: currentUser,
                  )));
      print(_currentUser);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
