import 'package:WBM_platform/src/config/constants.dart';
import 'package:WBM_platform/src/screens/home_screen/components/splash_content.dart';
import 'package:WBM_platform/src/screens/home_screen/components/what_content.dart';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 0;

  final List<Map<String, String>> splashData = [
    {
      "text":
          "The correct foot weighting at the site of the surgery helps to grow bone, which allows faster recovery after surgery. And also helps the Bones Stronger.",
      "image": "assets/images/why_image1.jpg"
    },
    {
      "text":
          "The survey found that 42 percent of the patients had the wrong foot weighting.",
      "image": "assets/images/why_image2.jpg"
    },
    {
      "text":
          "The wrong weighting of your feet after the surgery will take more time to recover and have effects that cannot be treated with physical therapy alone.",
      "image": "assets/images/why_image3.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WhatContent(),
          _buildTopicText(text: "Why the WBM Platform ?"),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                height: 370,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  splashData.length,
                  (index) => _buildDot(index: index),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          _buildTopicText(text: "How to use the WBM Platform ?"),
          SizedBox(
            height: 10,
          ),
          Image.asset("assets/images/how_to_use.jpg"),
          SizedBox(
            height: 30,
          ),
          Text(
            "Comming soon...",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            
          ),
          Container(height: 500,),
        ],
      ),
    );
  }

  Row _buildTopicText({String text}) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 30,
          width: 7,
          color: kPrimaryColor,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
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
