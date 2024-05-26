// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:np_com_pandeykushal/view/export_view.dart';
import 'package:np_com_pandeykushal/view/screens/cart/order_summary.dart';
import 'package:np_com_pandeykushal/view_model/export_view_model.dart';
import 'package:provider/provider.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const String routeName = "/CartScreen";
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  // late final controller = SlidableController();
  // final SlidableController controller = SlidableController();
  final cartProv = HomeProvider();
  int count = 1;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProv = Provider.of<HomeProvider>(context);

    final subTotal = cartProv.getTotalPrice();
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
                        " \$${subTotal.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.black,
                            ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    width: sizewidth(context) * 0.6,
                    backgroundColor: AppColor.black,
                    text: "Check out",
                    onTap: () {
                      context.push(OrderSummary.routeName);
                    },
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
          children: [
            CustomAppBar(
              title: "Cart",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600, color: AppColor.black),
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
            Consumer<HomeProvider>(builder: (context, cartProv, child) {
              return ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: cartProv.cartItems.length,
                itemBuilder: (context, index) {
                  final product = cartProv.cartItems[index];
                  return Slidable(
                    // controller: controller,
                    key: const ValueKey(1),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          key: ValueKey(product.id),
                          onPressed: (context) {
                            cartProv.removeFromCart(product);
                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: SizedBox(
                      height: 90,
                      child: Row(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            color: AppColor.gray,
                            child: Image.network(product.imageSmall ?? ""),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: sizewidth(context) * 0.01),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black,
                                      ),
                                ),
                                Text(
                                  '${product.brandName ?? ""} .Nikey  ${product.size ?? ""}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.black,
                                      ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "\$ ${product.price.toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: AppColor.black,
                                          ),
                                    ),
                                    SizedBox(
                                      width: sizewidth(context) * 0.25,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: decrement,
                                            icon: const Icon(
                                              Icons.remove_circle_rounded,
                                              color: AppColor.primary1,
                                            )),
                                        Center(
                                            child: Text(
                                          count.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.black),
                                        )),
                                        IconButton(
                                            onPressed: increment,
                                            icon: const Icon(
                                              Icons.add_circle_outlined,
                                              color: AppColor.primary1,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            })
          ],
        ),
      ),
    ));
  }
}
