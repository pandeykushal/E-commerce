// ignore_for_file: unnecessary_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:np_com_pandeykushal/view_model/export_view_model.dart';
import 'package:provider/provider.dart';

import '../../../view_model/utils/export_utils.dart';
import '../../export_view.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});
  static const String routeName = "/OrderSummary";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OrderSummary(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProv = Provider.of<HomeProvider>(context);
    final orderItems = cartProv.cartItems;
    final subTotal = cartProv.getTotalPrice();
    const shipping = 20.00;
    final totalOrder = subTotal + shipping;

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
                  Column(
                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColor.black,
                            ),
                      ),
                      Text(
                        " \$${totalOrder.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.black,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    width: sizewidth(context) * 0.4,
                    backgroundColor: AppColor.black,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.white,
                        ),
                    text: "Payment",
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
      body: Column(
        children: [
          CustomAppBar(
            title: "Order Summary",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600, color: AppColor.black),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                Text(
                  "Information",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColor.black,
                      ),
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.020,
                ),
                const summerywidget(
                  isicon: true,
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.020,
                ),
                const summerywidget(
                  isicon: true,
                  maintitle: "Location",
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.020,
                ),
                Text(
                  "Order Detail",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColor.black,
                      ),
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.020,
                ),
                ListView.builder(
                    itemCount: orderItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return summerywidget(
                        istext: true,
                        ispadding: true,
                        maintitle: orderItems[index].name,
                        subtitle:
                            ' ${orderItems[index].brandName ?? ""} .Nikey  ${orderItems[index].size ?? ""}',
                        subSubtitle:
                            " \$ ${orderItems[index].price.toString()}",
                      );
                    }),
                SizedBox(
                  height: sizeHeight(context) * 0.020,
                ),
                Text(
                  "Payment Detail",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColor.black,
                      ),
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.020,
                ),
                Row(
                  children: [
                    Text(
                      "Sub Total",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      " \$${subTotal.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.020,
                ),
                Row(
                  children: [
                    Text(
                      "Shipping",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      " \$${shipping.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: sizeHeight(context) * 0.020,
                ),
                Row(
                  children: [
                    Text(
                      "Total Order",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.black,
                          ),
                    ),
                    const Spacer(),
                    Text(
                      " \$${totalOrder.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class summerywidget extends StatelessWidget {
  const summerywidget({
    super.key,
    this.isicon = false,
    this.istext = false,
    this.ispadding = false,
    this.maintitle,
    this.subtitle,
    this.subSubtitle,
  });
  final bool isicon;
  final bool istext;
  final String? maintitle;
  final String? subtitle;
  final String? subSubtitle;
  final bool ispadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ispadding
          ? EdgeInsets.only(bottom: sizewidth(context) * 0.05)
          : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maintitle ?? "Payment Method",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColor.black,
                ),
          ),
          SizedBox(
            height: sizeHeight(context) * 0.005,
          ),
          Row(
            children: [
              Text(
                subtitle ?? "Credit Card",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
              ),
              const Spacer(),
              istext
                  ? Text(
                      subSubtitle ?? "Credit Card",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.black,
                          ),
                    )
                  : const SizedBox.shrink(),
              isicon
                  ? const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColor.darkgray,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
