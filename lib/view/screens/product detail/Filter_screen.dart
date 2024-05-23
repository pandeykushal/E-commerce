import 'package:flutter/material.dart';

import '../../../view_model/utils/export_utils.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});
  static const String routeName = "/FilterScreen";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const FilterScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(sizewidth(context) * 0.07, 0,
            sizewidth(context) * 0.07, sizeHeight(context) * 0.1),
      ),
    ));
  }
}
