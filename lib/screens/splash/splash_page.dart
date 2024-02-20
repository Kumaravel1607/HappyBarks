import 'package:flutter/material.dart';
import 'package:happy_bark/screens/login/login_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:happy_bark/widgets/bottom_nav_bar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _checkAuthToken();
    super.initState();
  }

  _checkAuthToken() async {
    final prefs = await Util.sharedPrefs;
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (prefs.getString(Constant.authToken) != null &&
          prefs.getString(Constant.authToken)!.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const BottomNavBar(
                  //schedulerBinding: true,
                  )),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginPage(
                  //schedulerBinding: true,
                  )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CommonColor.whiteColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 48, right: 48),
              child: Image.asset(
                "assets/images/app_logo.png",
                height: 127,
              ),
            ),
          ),
        ));
  }
}
