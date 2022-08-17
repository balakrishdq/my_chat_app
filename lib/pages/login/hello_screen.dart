import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_chat_app/pages/login/Components/lets_start.dart';
import 'package:my_chat_app/pages/login/Components/logo.dart';
import 'package:my_chat_app/pages/login/Components/terms_and_conditions.dart';
import 'package:my_chat_app/pages/login/edit_number.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg1.jpeg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 9,
          sigmaY: 9,
        ),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Logo(
                height: 150.0,
                radius: 50.0,
                width: 150.0,
              ),
              Text(
                'Hello',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 60,
                ),
              ),
              Column(
                children: [
                  Text(
                    'This app is a Cross-platform',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Mobile messaging with friends',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'all over the world',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              TermsAndConditions(
                OnPressed: () {},
              ),
              LetsStart(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => EditNumber()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
