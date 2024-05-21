import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:np_com_pandeykushal/view/screens/base_page.dart';
import 'package:np_com_pandeykushal/view/screens/error_page.dart';
import 'package:np_com_pandeykushal/view/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../../view/screens/product detail/export_screens.dart';

class GoRouteNavigation {
  static final GoRouter _router = GoRouter(
    initialLocation: SplashScreen.routeName,
    observers: [BotToastNavigatorObserver()],
    routes: [
      //SPLASH SCREEN//
      GoRoute(
          path: SplashScreen.routeName,
          name: 'splashscreen',
          builder: (context, state) => const SplashScreen()),

//error page
      GoRoute(
          path: CustomErrorPage.routeName,
          name: 'errorPage',
          builder: (context, state) => CustomErrorPage(
                errorDetails: state.extra as FlutterErrorDetails?,
              )),
//basepage
      GoRoute(
        path: BasePage.routeName,
        name: "basepage",
        builder: (context, state) => const BasePage(),
      ),
      //basepage
      GoRoute(
        path: ProductDetail.routeName,
        name: "/productDetail",
        builder: (context, state) => const ProductDetail(),
      ),
    ],
  );

  GoRouter get goRouter => _router;
}
