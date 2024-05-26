// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          margin: const EdgeInsets.only(right: 10, left: 10),
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
                      
                     style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                      text: "Reset",
                      onTap: () {
                        Provider.of<HomeProvider>(context, listen: false).reset;
                      },
                    ),
                    const Spacer(),
                    CustomButton(
                      width: sizewidth(context) * 0.4,
                      backgroundColor: AppColor.black,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.white,
                          ),
                      text: "Apply",
                      onTap: () {
                        context.push(BasePage.routeName);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: Consumer<HomeProvider>(builder: (context, homeProv, child) {
          return SingleChildScrollView(
            child: Padding(
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
                      child: const Icon(
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
                                          width: sizewidth(context) * 0.23,
                                          height: sizeHeight(context) * 0.08,
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
                                        if (homeProv.selectedIndexbrands ==
                                            index)
                                          Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Container(
                                              height: 22.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                color: AppColor.black,
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
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
                                            color: const Color(0xFFB7B7B7),
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
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFAAAAAA),
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '\$${_maxValue.round()}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
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
                                  color:
                                      homeProv.selectedButton == "Most recent"
                                          ? AppColor.white
                                          : AppColor.black,
                                ),
                            width: sizewidth(context) * 0.32,
                            onTap: () {
                              homeProv.selectButton("Most recent");
                            }),
                        SizedBox(
                          width: sizewidth(context) * 0.02,
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
                                  color:
                                      homeProv.selectedButton == "Lowest price"
                                          ? AppColor.white
                                          : AppColor.black,
                                ),
                            width: sizewidth(context) * 0.32,
                            onTap: () {
                              homeProv.selectButton("Lowest price");
                            }),
                        const SizedBox(
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
                                  color: homeProv.selectedButton ==
                                          "Highest  price"
                                      ? AppColor.white
                                      : AppColor.black,
                                ),
                            width: sizewidth(context) * 0.32,
                            onTap: () {
                              homeProv.selectButton("Highest  price");
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: sizeHeight(context) * 0.02),
                  Text(
                    "Gender",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                  ),
                  SizedBox(height: sizeHeight(context) * 0.02),
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
                            width: sizewidth(context) * 0.32,
                            onTap: () {
                              homeProv.selectedButtonGenders("Man");
                            }),
                        SizedBox(
                          width: sizewidth(context) * 0.02,
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
                                  color:
                                      homeProv.selectedButtonGender == "Woman"
                                          ? AppColor.white
                                          : AppColor.black,
                                ),
                            width: sizewidth(context) * 0.32,
                            onTap: () {
                              homeProv.selectedButtonGenders("Woman");
                            }),
                        SizedBox(
                          width: sizewidth(context) * 0.02,
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
                                  color:
                                      homeProv.selectedButtonGender == "Unisex"
                                          ? AppColor.white
                                          : AppColor.black,
                                ),
                            width: sizewidth(context) * 0.32,
                            onTap: () {
                              homeProv.selectedButtonGenders("Unisex");
                            }),
                      ],
                    ),
                  ),
                  SizedBox(height: sizeHeight(context) * 0.02),
                  Text(
                    "Color",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black,
                        ),
                  ),
                  SizedBox(height: sizeHeight(context) * 0.02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const ColorContainer(
                          colorName: "Black",
                          color: AppColor.black,
                        ),
                        SizedBox(
                          width: sizewidth(context) * 0.02,
                        ),
                        const ColorContainer(
                          colorName: "White",
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: sizewidth(context) * 0.02,
                        ),
                        const ColorContainer(
                          colorName: "Red",
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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

class ColorContainer extends StatelessWidget {
  final String colorName;
  final Color color;

  const ColorContainer({super.key, 
    required this.colorName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        bool isSelected = homeProvider.selectedColor == colorName;
        return GestureDetector(
          onTap: () {
            homeProvider.selectColor(colorName);
          },
          child: Container(
            height: 45,
            width: sizewidth(context) * 0.32,
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColor.black : Colors.grey,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 20.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(color: AppColor.darkGray),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Text(
                  colorName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColor.black,
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
