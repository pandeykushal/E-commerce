import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/providers/export_provider.dart';
import '../../view_model/utils/export_utils.dart';

import 'package:flutter_svg/flutter_svg.dart';

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
      child: Consumer<HomeProvider>(builder: (context, baseProv, child) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: sizewidth(context) * 0.07),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Discover",
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.black,
                                ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        CustomImageGetter.cart,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TabBar(
                    tabAlignment: TabAlignment.center,
                    onTap: (index) {
                      baseProv.setIndex(index);
                    },
                    tabs: const [
                      Tab(
                        text: 'All',
                      ),
                      Tab(text: 'Nike'),
                      Tab(text: 'Jordan'),
                      Tab(text: 'Adidas'),
                      Tab(text: 'Reebok'),
                    ],
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.black,
                        ),
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.gray,
                            ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text('All')),
                        Center(child: Text('Nike')),
                        Center(child: Text('Jordan')),
                        Center(child: Text('Adidas')),
                        Center(child: Text('Reebok')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
