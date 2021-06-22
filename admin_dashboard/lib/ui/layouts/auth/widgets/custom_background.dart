import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBackgroundImage(),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image(
              image: AssetImage('twitter-white-logo.png'),
              width: 400,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBackgroundImage() => BoxDecoration(
        image: DecorationImage(
          image: AssetImage('twitter-bg.png'),
          fit: BoxFit.cover,
        ),
      );
}
