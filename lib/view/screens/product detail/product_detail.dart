import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:np_com_pandeykushal/view_model/export_view_model.dart';
import 'package:provider/provider.dart';

import 'package:np_com_pandeykushal/view_model/utils/colors.dart';

import '../../../model/app_models/product_model.dart';
import '../../../view_model/providers/export_provider.dart';
import '../../../view_model/utils/export_utils.dart';
import '../../export_view.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, this.product});
  static const String routeName = "/productDetail";
  final Product? product;
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sizewidth(context) * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                "\$ ${product?.price.toString() ?? ""}",
                                // "\$ 235,00",
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
                        ),
                        Spacer(),
                        CustomButton(
                          width: sizewidth(context) * 0.45,
                          backgroundColor: AppColor.black,
                          text: "ADD TO CART",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white,
                                  ),
                          onTap: () {
                            Provider.of<HomeProvider>(context, listen: false)
                                .addToCart(product!);
                            showBotToast(text: "Added to cart");
                            showModalBottomSheet(
                              backgroundColor: AppColor.white,
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: sizeHeight(context) * 0.45,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: AppColor.white,
                                              border: Border.all(width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: const Icon(
                                            Icons.check,
                                            color: AppColor.darkgray,
                                            size: 80,
                                          ),
                                        ),
                                        Text(
                                          "Added to cart",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: AppColor.black,
                                              ),
                                        ),
                                        Text(
                                          "1 Item Total",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.black,
                                              ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Buttonoutlined(
                                              height: sizeHeight(context) * .05,
                                              width: sizewidth(context) * 0.4,
                                              buttonColor: AppColor.black,
                                              buttonText: "Back Explore",
                                              onPressed: () {
                                                context
                                                    .push(BasePage.routeName);
                                              },
                                            ),
                                            CustomButton(
                                                width:
                                                    sizewidth(context) * 0.35,
                                                backgroundColor: AppColor.black,
                                                text: "To Cart",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: AppColor.white,
                                                    ),
                                                onTap: () {
                                                  context.push(
                                                      CartScreen.routeName);
                                                })
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
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
                        InkWell(
                          onTap: () {
                            context.push(CartScreen.routeName);
                          },
                          child: SvgPicture.asset(
                            CustomImageGetter.cart,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          width: sizewidth(context),
                          height: sizeHeight(context) * 0.35,
                          decoration: const BoxDecoration(
                            color: AppColor.lightgray,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child:
                                      Image.network(product?.imageSmall ?? "")),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          right: 15,
                          child: Row(
                            children: [
                              const IndicatorContainerdetail(
                                color: AppColor.black,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: sizewidth(context) * 0.01),
                                child: const IndicatorContainerdetail(
                                  color: AppColor.darkgray,
                                ),
                              ),
                              const IndicatorContainerdetail(
                                color: AppColor.darkgray,
                              ),
                              const Spacer(),
                              Container(
                                height: 40,
                                width: 135,
                                decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IndicatorContainerdetail(
                                        color: AppColor.white,
                                        isborder: true,
                                        height: 20,
                                        width: 20,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    IndicatorContainerdetail(
                                        color: AppColor.black,
                                        height: 20,
                                        width: 20,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    IndicatorContainerdetail(
                                        color: const Color(0xFF648B8B),
                                        height: 20,
                                        width: 20,
                                        borderRadius: BorderRadius.circular(50),
                                        child: const Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 15,
                                          ),
                                        )),
                                    IndicatorContainerdetail(
                                        color: const Color(0xFF2952CC),
                                        height: 20,
                                        width: 20,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const mainsize(),
                    Text(
                      product?.name ?? "",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.010,
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemPadding: EdgeInsets.zero,
                          rating: product?.avgRating ?? -0.0,
                          itemBuilder: (context, index) => const Icon(
                              Icons.star_rounded,
                              color: Colors.orange),
                          unratedColor: AppColor.black.withOpacity(0.4),
                          itemCount: 5,
                          itemSize: 15,
                          direction: Axis.horizontal,
                        ),
                        SizedBox(
                          width: sizewidth(context) * 0.02,
                        ),
                        Text(
                          product?.avgRating.toString() ?? "",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.black,
                                  ),
                        ),
                        SizedBox(
                          width: sizewidth(context) * 0.02,
                        ),
                        Text(
                          "${product?.totalRating ?? ""} Reviews",
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                  ),
                        ),
                      ],
                    ),
                    const mainsize(),
                    Text(
                      "Size",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.01,
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
                                formatSize(
                                  homeProv.sizes[index],
                                ),
                                // homeProv.sizes[index].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: homeProv.selectedShoeSize == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                // style: TextStyle(
                                //   color: homeProv.selectedShoeSize == index
                                //       ? Colors.white
                                //       : Colors.black,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const mainsize(),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.black,
                          ),
                    ),
                    const mainsize(),
                    Text(
                      product?.description ?? " ",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF666666),
                          ),
                    ),
                    const mainsize(),
                    Text(
                      "Reviews ${product?.totalRating ?? ""}",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.01,
                    ),
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: ((context, index) {
                          return const RatingDetailWidget();
                        })),
                    const mainsize(),
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

class mainsize extends StatelessWidget {
  const mainsize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeHeight(context) * 0.01,
    );
  }
}

class IndicatorContainerdetail extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final bool isborder;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  const IndicatorContainerdetail({
    Key? key,
    this.color,
    this.height,
    this.width,
    this.isborder = false,
    this.borderRadius,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 7,
      width: width ?? 7,
      decoration: BoxDecoration(
          color: color ?? AppColor.black,
          borderRadius: borderRadius ?? BorderRadius.circular(5),
          border: isborder ? Border.all(color: AppColor.darkgray) : null),
      child: child,
    );
  }
}
