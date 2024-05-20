import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:np_com_pandeykushal/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'view/screens/export_screens.dart';
import 'view_model/export_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top,
  ]);

  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        builder: (context, widget) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Kushal App ',
            routerDelegate: GoRouteNavigation().goRouter.routerDelegate,
            routeInformationProvider:
                GoRouteNavigation().goRouter.routeInformationProvider,
            routeInformationParser:
                GoRouteNavigation().goRouter.routeInformationParser,
            theme: CustomTheme.appTheme(),
            builder: (context, widget) {
              widget = BotToastInit()(context, widget);
              widget =
                  ResponsiveBreakpoints.builder(child: widget, breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              ]);
              widget = errorInit(context, widget);
              return widget!;
            },
          );
        });
  }

  static errorInit(BuildContext context, Widget? widget) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return CustomErrorPage(errorDetails: errorDetails);
    };
    return widget!;
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
