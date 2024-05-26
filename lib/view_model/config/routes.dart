import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../view/screens/cart/order_summary.dart';
import '../../view/screens/export_screens.dart';

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

      GoRoute(
          path: OrderSummary.routeName,
          name: 'OrderSummary',
          builder: (context, state) => const OrderSummary()),

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
      //filter
      GoRoute(
        path: FilterScreen.routeName,
        name: "/filterScreen",
        builder: (context, state) => const FilterScreen(),
      ),
      GoRoute(
        path: ReviewScreen.routeName,
        name: "/reviewScreen",
        builder: (context, state) => const ReviewScreen(),
      ),
      GoRoute(
        path: CartScreen.routeName,
        name: "/CartScreen",
        builder: (context, state) => const CartScreen(),
      ),
    ],
  );

  GoRouter get goRouter => _router;
}
