import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../view_model/providers/export_provider.dart';
import '../../../view_model/utils/export_utils.dart';
import '../../export_view.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});
  static const String routeName = "/reviewScreen";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ReviewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseProv = Provider.of<HomeProvider>(context);
    return DefaultTabController(
      length: 6,
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(sizewidth(context) * 0.07, 0,
              sizewidth(context) * 0.07, sizeHeight(context) * 0.1),
          child: Column(
            children: [
              CustomAppBar(
                title: "Review (1045)",
                leadingWidth: 1,
                leading: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                actions: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: AppColor.yellow,
                        size: 20.h,
                      ),
                      SizedBox(
                        height: sizewidth(context) * 0.04,
                      ),
                      Text(
                        '4.5',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black,
                                ),
                      )
                    ],
                  )
                ],
              ),
              TabBar(
                tabAlignment: TabAlignment.center,
                onTap: (index) {
                  baseProv.setIndexRating(index);
                },
                tabs: const [
                  Tab(
                    text: 'All',
                  ),
                  Tab(text: '5 Star'),
                  Tab(text: '4 Star'),
                  Tab(text: '3 Star'),
                  Tab(text: '2 Star'),
                  Tab(text: '1 Star'),
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
              const Expanded(
                child: TabBarView(
                  children: [
                    Center(
                      child: Rating(),
                    ),
                    Center(child: Rating()),
                    Center(child: Rating()),
                    Center(child: Rating()),
                    Center(child: Rating()),
                    Center(child: Rating()),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        primary: false,
        itemBuilder: ((context, index) {
          return const RatingDetailWidget();
        }));
  }
}
