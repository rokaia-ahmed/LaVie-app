
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../Sign_up/sign_up.dart';
import '../login/login_screen.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/images/image 68 (Traced).png',
                height: 120,
              ),
            ),
            Image.asset('assets/images/logo.png',
            width: 70,
            ),
           const SizedBox(
              height: 10,
            ),
           const TabBar(
              unselectedLabelColor: Colors.grey,
                labelColor:primerColor ,
                indicatorColor: primerColor,
                indicatorSize:TabBarIndicatorSize.label ,
                tabs:[
                  Tab(
                    text: 'Sign up',
                  ),
                  Tab(
                    text: 'Login',
                  ),
                ]
            ),
            Flexible(
              child: TabBarView(
                  children:[
                    SignUp(),
                    LoginScreen(),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
