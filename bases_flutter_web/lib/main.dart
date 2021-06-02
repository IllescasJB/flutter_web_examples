import 'package:bases_flutter_web/locator.dart';
import 'package:bases_flutter_web/route/route_generator.dart';
import 'package:bases_flutter_web/services/navigation_service.dart';
import 'package:bases_flutter_web/ui/layout/main_layout_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RutasApp',
      home: Container(),
      initialRoute: '/stateful',
      onGenerateRoute: RouteGenerator.generatedRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: (_, child) {
        return MainLayoutPage(
          child: child ??
              Center(
                child: CircularProgressIndicator(),
              ),
        );
      },
    );
  }
}
