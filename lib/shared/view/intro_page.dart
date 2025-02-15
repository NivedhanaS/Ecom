import 'package:ecommerce_int2/app/user_and_seller/view/auth/welcome_back_page.dart';
import 'package:ecommerce_int2/helper/app_properties.dart';
import 'package:ecommerce_int2/helper/base.dart';
import 'package:ecommerce_int2/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/user_and_seller/view/main/main_page.dart';

class IntroPage extends StatefulWidget {
  static const String routeName = "/IntroPage";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  int pageIndex = 0;

  Future<void> _checkIntroStatusAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool introShown = prefs.getBool('introShown') ?? false;
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    String email = prefs.getString("userEmail") ?? "";
    if (introShown) {
      // Navigator.of(context).pushReplacementNamed(WelcomeBackPage.routeName);
      isLoggedIn ? launch(context, MainPage.routeName, email):
      replace(context, WelcomeBackPage.routeName);

    }
  }

    @override
  void initState() {
    super.initState();
    _checkIntroStatusAndNavigate();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = context.extra;
    return Material(
      child: Container(
//      width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            image: DecorationImage(image: AssetImage('assets/background.png'))),
        child: Stack(children: <Widget>[
          PageView(
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              controller: controller,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/firstScreen.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Get Any Thing Online',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16.0),
                      child: Text(
                        'You can buy anything ranging from digital products to hardware within few clicks.',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        'assets/secondScreen.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Shipping to anywhere ',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16.0),
                      child: Text(
                        'We will ship to anywhere in the world, With 30 day 100% money back policy.',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: Image.asset(
                          'assets/thirdScreen.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          'On-time delivery',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16.0),
                        child: Text(
                          'You can track your product with our powerful tracking service.',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                      ),
                    ]),
              ]),
          Positioned(
            bottom: 16.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 0 ? yellow : Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 1 ? yellow : Colors.white),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                            color: pageIndex == 2 ? yellow : Colors.white),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Opacity(
                        opacity: pageIndex != 2 ? 1.0 : 0.0,
                        child: MaterialButton(
                          splashColor: Colors.transparent,
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('introShown', true);
                            launchReplace(context, WelcomeBackPage.routeName);
                          },
                        ),
                      ),
                      pageIndex != 2
                          ? MaterialButton(
                              splashColor: Colors.transparent,
                              child: Text(
                                'NEXT',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () {
                                if (!(controller.page == 2.0)) {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.linear);
                                }
                              },
                            )
                          : MaterialButton(
                              splashColor: Colors.transparent,
                              child: Text(
                                'FINISH',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool('introShown', true);
                                replace(context, WelcomeBackPage.routeName);
                              },
                            ),
                    ]),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
