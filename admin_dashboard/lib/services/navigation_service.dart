import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigationKey =
      new GlobalKey<NavigatorState>();

  static navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName) {
    return navigationKey.currentState!.pushReplacementNamed(routeName);
  }
}
