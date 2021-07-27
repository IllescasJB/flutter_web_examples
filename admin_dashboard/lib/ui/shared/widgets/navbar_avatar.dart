import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network(
          'https://lh3.googleusercontent.com/ogw/ADea4I5i2Aa_L0MvNod7yD5GFR0clO1U4XjIrv24_OmW6w=s83-c-mo',
        ),
        width: 30,
        height: 30,
      ),
    );
  }
}
