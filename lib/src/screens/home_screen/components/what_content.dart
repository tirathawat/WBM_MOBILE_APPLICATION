import 'package:WBM_platform/src/config/constants.dart';
import 'package:flutter/material.dart';

class WhatContent extends StatelessWidget {
  const WhatContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          
          Stack(
            children: [
              Image.asset("assets/images/banner.jpg"),
              Positioned(
                right: 0,
                bottom: 70,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "WBM ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Platform",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      Text("Weight-bearing measuring platform", textAlign: TextAlign.start,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 30,
                width: 7,
                color: kPrimaryColor,
              ),
              Text(
                "What is the WBM Platform ?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset("assets/images/physical_therapy.png"),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kPrimaryColor,
                width: 2,
              ),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text(
              "We are a platform to measure foot weight for postoperative therapy.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
