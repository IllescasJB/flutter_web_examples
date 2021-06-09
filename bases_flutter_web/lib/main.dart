import 'package:bases_flutter_web/locator.dart';
import 'package:bases_flutter_web/route/router.dart';
import 'package:bases_flutter_web/services/navigation_service.dart';
import 'package:bases_flutter_web/ui/layout/main_layout_page.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RutasApp',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: (_, child) {
        return MainLayoutPage(
          child: child ??
              Center(
                child: CircularProgressIndicator(),
              ),
        );
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
