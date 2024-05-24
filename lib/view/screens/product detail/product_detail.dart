import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../view_model/providers/export_provider.dart';
import '../../../view_model/utils/export_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../export_view.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});
  static const String routeName = "/productDetail";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ProductDetail());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProv, child) {
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
                        Column(
                          children: [
                            Text(
                              'Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                  ),
                            ),
                            Text(
                              "\$ 235,00",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.black,
                                  ),
                            ),
                          ],
                        ),
                        Spacer(),
                        CustomButton(
                          width: sizewidth(context) * 0.6,
                          backgroundColor: AppColor.black,
                          text: "ADD TO CART",
                          onTap: () {},
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            
            
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(sizewidth(context) * 0.07, 0,
                    sizewidth(context) * 0.07, sizeHeight(context) * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      title: "",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600, color: AppColor.black),
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
                   
                    Container(
                      width: double.infinity,
                      height: 315,
                      decoration: BoxDecoration(
                        color: AppColor.lightgray,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          //   child: Row(
                          //     children: [
                          //       SvgPicture.asset(
                          //         product['icon']!,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Image.asset(
                              CustomImageGetter.nikeyS1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Jordan 1 Retro High Tie Dye",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_purple500_outlined,
                          color: Colors.amber,
                        ),
                        Text(
                          "4.5",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.black,
                                  ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '(1045 Reviews)',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                  ),
                        ),
                      ],
                    ),
                    Text(
                      "Size",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(homeProv.sizes.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            homeProv.selectSize(index);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                              color: homeProv.selectedShoeSize == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                formatSize(homeProv.sizes[index]),
                                // homeProv.sizes[index].toString(),
                                style: TextStyle(
                                  color: homeProv.selectedShoeSize == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    ),
                    Text(
                      "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                    ),
                    Text(
                      "Reviews (1045)",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.black,
                                        ),
                                  ),
                                  RatingBarIndicator(
                                    itemPadding: EdgeInsets.zero,
                                    rating: 2,
                                    itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.orange),
                                    unratedColor:
                                        AppColor.black.withOpacity(0.4),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.black,
                                        ),
                                  ),
                                  RatingBarIndicator(
                                    itemPadding: EdgeInsets.zero,
                                    rating: 2,
                                    itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.orange),
                                    unratedColor:
                                        AppColor.black.withOpacity(0.4),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.black,
                                        ),
                                  ),
                                  RatingBarIndicator(
                                    itemPadding: EdgeInsets.zero,
                                    rating: 2,
                                    itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.orange),
                                    unratedColor:
                                        AppColor.black.withOpacity(0.4),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
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
                    Buttonoutlined(
                      buttonColor: AppColor.black,
                      buttonText: "See All Review",
                      onPressed: () {
                        context.push(ReviewScreen.routeName);
                      },
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String formatSize(double size) {
    return size == size.toInt() ? size.toInt().toString() : size.toString();
  }
}
