import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  //Auth Router
  static String loginRouter = '/auth/login';
  static String registerRouter = '/auth/register';

  //Dashboard Router
  static String dashboardRoute = '/dashboard';

  static void configureRoutes() {
    //Auth Routes
    router.define(rootRoute,
        handler: AdminHandlres.login, transitionType: TransitionType.none);
    router.define(loginRouter,
        handler: AdminHandlres.login, transitionType: TransitionType.none);
    router.define(registerRouter,
        handler: AdminHandlres.register, transitionType: TransitionType.none);

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
