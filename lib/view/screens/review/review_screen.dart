import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(sizewidth(context) * 0.07, 0,
            sizewidth(context) * 0.07, sizeHeight(context) * 0.1),
        child: SingleChildScrollView(
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
              ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: ((context, index) {
                    return const RatingDetailWidget();
                  })),
            ],
          ),
        ),
      ),
    ));
  }
}
