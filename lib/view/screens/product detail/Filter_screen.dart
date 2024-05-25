import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../view_model/providers/export_provider.dart';
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
  final double _minValue = 0;
  final double _maxValue = 1750;

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
        body: Consumer<HomeProvider>(builder: (context, homeProv, child) {
          return Padding(
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
                ),
                Text(
                  "Brands",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.15,
                  child: Consumer<HomeProvider>(
                    builder: (context, homeProv, child) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeProv.brands.length,
                        itemBuilder: (context, index) {
                          final brand = homeProv.brands[index];
                          return GestureDetector(
                            onTap: () {
                              homeProv.selectBrand(index);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: sizeHeight(context) * 0.1,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColor.gray,
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset(
                                            brand['image']!,
                                          ),
                                        ),
                                      ),
                                      if (homeProv.selectedIndexbrands == index)
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              color: AppColor.black,
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                                    brand['name']!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.black,
                                        ),
                                  ),
                                  Text(
                                    brand['items']!,
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
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       children: [
                //         Stack(
                //           children: [
                //             Container(
                //               width: sizeHeight(context) * 0.1,
                //               height: 50,
                //               decoration: const BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: AppColor.gray,
                //               ),
                //               child: Center(
                //                 child: SvgPicture.asset(
                //                   CustomImageGetter.nikeyb,
                //                 ),
                //               ),
                //             ),
                //             Positioned(
                //               bottom: 0,
                //               right: 0,
                //               child: Container(
                //                 height: 22,
                //                 width: 22,
                //                 decoration: BoxDecoration(
                //                   color: AppColor.black,
                //                   borderRadius: BorderRadius.circular(50),
                //                 ),
                //                 child: const Center(
                //                   child: Icon(
                //                     Icons.check,
                //                     size: 13,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //         Text(
                //           "NIKE",
                //           style:
                //               Theme.of(context).textTheme.titleSmall?.copyWith(
                //                     fontWeight: FontWeight.w700,
                //                     color: AppColor.black,
                //                   ),
                //         ),
                //         Text(
                //           "1001 Items",
                //           style:
                //               Theme.of(context).textTheme.labelMedium?.copyWith(
                //                     fontWeight: FontWeight.w400,
                //                     color: Color(0xFFB7B7B7),
                //                   ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),

                Text(
                  "Brands",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                ),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.black,
                            inactiveTrackColor: Colors.grey.shade300,
                            thumbColor: Colors.black,
                            overlayColor: Colors.black.withOpacity(0.2),
                          ),
                          child: RangeSlider(
                            values: _currentRangeValues,
                            min: _minValue,
                            max: _maxValue,
                            labels: RangeLabels(
                              '\$${_currentRangeValues.start.round()}',
                              '\$${_currentRangeValues.end.round()}',
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                              });
                            },
                          ),
                        ),
                        Positioned(
                          left: _calculatePosition(
                              context, _currentRangeValues.start),
                          bottom:
                              -2, // Adjust this value to move the text higher or lower
                          child: Text(
                            '\$${_currentRangeValues.start.round()}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                          ),
                        ),
                        Positioned(
                          left: _calculatePosition(
                              context, _currentRangeValues.end),
                          bottom:
                              -2, // Adjust this value to move the text higher or lower
                          child: Text(
                            '\$${_currentRangeValues.end.round()}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${_minValue.round()}',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFAAAAAA),
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          '\$${_maxValue.round()}',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFFAAAAAA),
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.02,
                ),
                Text(
                  "Sort By",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.02,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomButton(
                          text: "Most recent",
                          backgroundColor:
                              homeProv.selectedButton == "Most recent"
                                  ? AppColor.black
                                  : AppColor.white,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: homeProv.selectedButton == "Most recent"
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                          width: 127,
                          onTap: () {
                            homeProv.selectButton("Most recent");
                          }),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButton(
                          text: "Lowest price",
                          border: true,
                          backgroundColor:
                              homeProv.selectedButton == "Lowest price"
                                  ? AppColor.black
                                  : AppColor.white,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: homeProv.selectedButton == "Lowest price"
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                          width: 127,
                          onTap: () {
                            homeProv.selectButton("Lowest price");
                          }),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButton(
                          text: "Highest  price",
                          border: true,
                          backgroundColor:
                              homeProv.selectedButton == "Highest  price"
                                  ? AppColor.black
                                  : AppColor.white,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color:
                                    homeProv.selectedButton == "Highest  price"
                                        ? AppColor.white
                                        : AppColor.black,
                              ),
                          width: 127,
                          onTap: () {
                            homeProv.selectButton("Highest  price");
                          }),
                    ],
                  ),
                ),
                Text(
                  "Gender",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CustomButton(
                          text: "Man",
                          backgroundColor:
                              homeProv.selectedButtonGender == "Man"
                                  ? AppColor.black
                                  : AppColor.white,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: homeProv.selectedButtonGender == "Man"
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                          width: 127,
                          onTap: () {
                            homeProv.selectedButtonGenders("Man");
                          }),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButton(
                          text: "Woman",
                          border: true,
                          backgroundColor:
                              homeProv.selectedButtonGender == "Woman"
                                  ? AppColor.black
                                  : AppColor.white,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: homeProv.selectedButtonGender == "Woman"
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                          width: 127,
                          onTap: () {
                            homeProv.selectedButtonGenders("Woman");
                          }),
                      SizedBox(
                        width: 20,
                      ),
                      CustomButton(
                          text: "Unisex",
                          border: true,
                          backgroundColor:
                              homeProv.selectedButtonGender == "Unisex"
                                  ? AppColor.black
                                  : AppColor.white,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: homeProv.selectedButtonGender == "Unisex"
                                    ? AppColor.white
                                    : AppColor.black,
                              ),
                          width: 127,
                          onTap: () {
                            homeProv.selectedButtonGenders("Unisex");
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Color",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
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
                            "Black",
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
          );
        }),
      ),
    );
  }

  double _calculatePosition(BuildContext context, double value) {
    double sliderWidth = MediaQuery.of(context).size.width - 40;
    double position =
        (value - _minValue) / (_maxValue - _minValue) * sliderWidth;
    return position;
  }
}
