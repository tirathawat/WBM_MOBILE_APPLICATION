import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/config/size_config.dart';
import 'package:WBM_platform/src/screens/sign_in_screen/sign_in_screen.dart';
import 'package:WBM_platform/src/screens/start_screen/components/splash_content.dart';
import 'package:WBM_platform/src/widgets/default_button.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 0;

  final List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Weight-bearing measuring Platform",
      "image": "assets/images/running_shoes.png"
    },
    {
      "text":
          "We will make your therapy effective by providing advice and measure the weight of your feet",
      "image": "assets/images/consultation.png"
    },
    {
      "text": "Your treatment will improve.. \nLet's start!",
      "image": "assets/images/disability_insurance.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (BuildContext context, int index) {
                  return SplashContent(
                    text: splashData[index]["text"],
                    image: splashData[index]["image"],
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => _buildDot(index: index),
                      ),
                    ),
                    Spacer(),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer _buildDot({int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(
        right: 5,
      ),
      height: 6,
      width: index == _currentPage ? 20 : 6,
      decoration: BoxDecoration(
        color: index == _currentPage ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
      duration: kAnimationDuration,
    );
  }
}
