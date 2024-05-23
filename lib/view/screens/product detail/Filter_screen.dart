import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  RangeValues _range1 =
      RangeValues(100, 1000); // Initial values within the new range

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              RangeSlider(
                min: 0.0,
                max: 1750.0,
                values: _range1,
                activeColor: AppColor.black,
                inactiveColor: AppColor.gray,
                divisions: 35, // Adjust divisions to match the new range
                labels: RangeLabels(
                  '\$${_range1.start.round()}',
                  '\$${_range1.end.round()}',
                ),
                onChanged: (values) {
                  setState(() {
                    _range1 = values;
                  });
                },
              ),
           
           ],
          ),
        ),
      ),
    );
  }
}
