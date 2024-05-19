import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:np_com_pandeykushal/view/screens/base_page.dart';
import 'package:np_com_pandeykushal/view/screens/error_page.dart';
import 'package:np_com_pandeykushal/view/screens/on_boarding_screen.dart';
import 'package:np_com_pandeykushal/view/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

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

      //BASEPAGE//

      GoRoute(
          path: OnBoardingScreen.routeName,
          name: 'onboardingScreen',
          builder: (context, state) => const OnBoardingScreen()),

      GoRoute(
          path: CustomErrorPage.routeName,
          name: 'errorPage',
          builder: (context, state) => CustomErrorPage(
                errorDetails: state.extra as FlutterErrorDetails?,
              )),

      GoRoute(
        path: BasePage.routeName,
        name: "basepage",
        builder: (context, state) => const BasePage(),
      ),
    ],
  );

  GoRouter get goRouter => _router;
}
