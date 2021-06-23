import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
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
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRouter,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRouter,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    router.define(
      dashboardRoute,
      handler: DashboardHandlers.dashboard,
      transitionType: TransitionType.fadeIn,
    );

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
