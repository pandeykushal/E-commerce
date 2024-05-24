import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        child: Column(
          children: [
            CustomAppBar(
              title: "Review (1045)",
              leadingWidth: 1,
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Icon(
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
                    ),
                    Text(
                      '4.5',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: 110,
              color: AppColor.primary,
              child: Column(
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "kushal Pandey ",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.black,
                                    ),
                          ),
                          RatingBarIndicator(
                            itemPadding: EdgeInsets.zero,
                            rating: 2,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star_rounded, color: Colors.orange),
                            unratedColor: AppColor.black.withOpacity(0.4),
                            itemCount: 5,
                            itemSize: 15,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        "Today",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColor.black,
                            ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      "Perfect for keeping your feet dry and warm in damp conditions. ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 110,
              color: AppColor.primary,
              child: Column(
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "kushal Pandey ",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.black,
                                    ),
                          ),
                          RatingBarIndicator(
                            itemPadding: EdgeInsets.zero,
                            rating: 2,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star_rounded, color: Colors.orange),
                            unratedColor: AppColor.black.withOpacity(0.4),
                            itemCount: 5,
                            itemSize: 15,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        "Today",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColor.black,
                            ),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      "Perfect for keeping your feet dry and warm in damp conditions. ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
