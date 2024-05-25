import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/utils/export_utils.dart';

class RatingDetailWidget extends StatelessWidget {
  const RatingDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeHeight(context) * 0.138,
      color: AppColor.primary,
      child: Column(
        children: [
          Row(children: [
            CircleAvatar(
              radius: 30.r,
              foregroundImage: const NetworkImage(
                  "https://images.unsplash.com/photo-1568602471122-7832951cc4c5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            ),
            Padding(
              padding: EdgeInsets.only(left: sizewidth(context) * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "kushal Pandey ",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.black,
                        ),
                  ),
                  RatingBarIndicator(
                    itemPadding: EdgeInsets.zero,
                    rating: 2,
                    itemBuilder: (context, index) =>
                        const Icon(Icons.star_rounded, color: Colors.orange),
                    unratedColor: AppColor.black.withOpacity(0.4),
                    itemCount: 5,
                    itemSize: 12.h,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: sizewidth(context) * 0.02),
              child: Text(
                "Today",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(left: sizewidth(context) * 0.18),
            child: Text(
              "Perfect for keeping your feet dry and warm in damp conditions. ",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.black,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
