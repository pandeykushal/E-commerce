import 'package:flutter/material.dart';
import 'package:np_com_pandeykushal/view/export_view.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  static const String routeName = "/basepage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const BasePage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'kushal  App', onBackTap: () {}),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomLoader(),
            Text('Welcome to  debug'),
          ],
        ),
      ),
    );
  }
}
