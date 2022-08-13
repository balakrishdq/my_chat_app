import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_chat_app/pages/login/Components/blur_page_scaffold.dart';
import 'package:my_chat_app/pages/login/Components/lets_start.dart';
import 'package:my_chat_app/pages/login/Components/logo.dart';
import 'package:my_chat_app/pages/login/Components/terms_and_conditions.dart';

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
            'assets/images/bg1.jpg',
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
              Logo(),
              Text('Hello'),
              Column(
                children: [
                  Text('This app is a Cross-platform'),
                  Text('Mobile messaging with friends'),
                  Text('all over the world'),
                ],
              ),
              TermsAndConditions(),
              LetsStart(),
            ],
          ),
        ),
      ),
    );
  }
}
