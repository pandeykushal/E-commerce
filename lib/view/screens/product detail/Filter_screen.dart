import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_router/go_router.dart';

import '../../../view_model/utils/export_utils.dart';
import '../../export_view.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  static const String routeName = "/FilterScreen";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const FilterScreen(),
    );
  }

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(0, 1750);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: Container(
          color: AppColor.primary,
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomButton(
                      border: true,
                      width: sizewidth(context) * 0.4,
                      backgroundColor: AppColor.white,
                      style: TextStyle(color: AppColor.black),
                      text: "Reset (4)",
                      onTap: () {},
                    ),
                    Spacer(),
                    CustomButton(
                      width: sizewidth(context) * 0.4,
                      backgroundColor: AppColor.black,
                      text: "Apply",
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(sizewidth(context) * 0.07, 0,
              sizewidth(context) * 0.07, sizeHeight(context) * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: "Filter",
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
                  SvgPicture.asset(
                    CustomImageGetter.cart,
                  ),
                ],
              ),
              
              Text(
                "Brands",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
              ),
              SizedBox(
                height: 120, // Adjust the height as needed
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  primary:
                      false, // Set to false when inside another scrollable widget
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.gray,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      CustomImageGetter.nikeyb,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      color: AppColor.black,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "NIKE",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.black,
                                  ),
                            ),
                            Text(
                              "1001 Items",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFB7B7B7),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              // SizedBox(height: 20), // Add some space between sections
              // Text(
              //   "Price Range 1: \$${_range1.start.round()} - \$${_range1.end.round()}",
              //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
              //         fontWeight: FontWeight.w700,
              //         color: AppColor.black,
              //       ),
              // ),

              Text(
                "Brands",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.black,
                  inactiveTrackColor: Colors.grey.shade300,
                  thumbColor: Colors.white,
                  overlayColor: Colors.black.withOpacity(0.2),
                ),
                child: RangeSlider(
                  values: _currentRangeValues,
                  min: 0,
                  max: 1750,
                  // divisions: 35,

                  labels: RangeLabels(
                    '\$${_currentRangeValues.start.round()}',
                    '\$${_currentRangeValues.end.round()}',
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                    });
                  },
                  activeColor: Colors.black,
                  inactiveColor: Colors.grey.shade300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$0',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    '\$${_currentRangeValues.start.round()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${_currentRangeValues.end.round()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$1750',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                "Sort By",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomButton(
                        text: "Most recent",
                        backgroundColor: AppColor.black,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.white,
                                ),
                        width: 127,
                        onTap: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                        text: "Lowest price",
                        border: true,
                        backgroundColor: AppColor.white,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black,
                                ),
                        width: 127,
                        onTap: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                        text: "Highest  price",
                        border: true,
                        backgroundColor: AppColor.white,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black,
                                ),
                        width: 127,
                        onTap: () {}),
                  ],
                ),
              ),
              Text(
                "Gender",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomButton(
                        text: "Man",
                        backgroundColor: AppColor.black,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.white,
                                ),
                        width: 127,
                        onTap: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                        text: "Woman",
                        border: true,
                        backgroundColor: AppColor.white,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black,
                                ),
                        width: 127,
                        onTap: () {}),
                    SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                        text: "Unisex",
                        border: true,
                        backgroundColor: AppColor.white,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.black,
                                ),
                        width: 127,
                        onTap: () {}),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Color",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
              ),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 127,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.black),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Text(
                          "Blavk",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.black,
                                  ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
