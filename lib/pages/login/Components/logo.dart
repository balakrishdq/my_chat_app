import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, this.height, this.radius, this.width})
      : super(key: key);
  final height;
  final width;
  final radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        shape: BoxShape.rectangle,
        color: Colors.white.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Image(
          image: AssetImage('assets/images/logo.jpeg'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
