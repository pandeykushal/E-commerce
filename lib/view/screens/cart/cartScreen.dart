import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:np_com_pandeykushal/view/export_view.dart';

import '../../../view_model/utils/export_utils.dart';
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
  late final controller = SlidableController(this);
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

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
                        "\$ 235,00",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                    text: "Check out",
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
            Slidable(
              controller: controller,
              key: const ValueKey(1),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Container(
                height: 90,
                child: Row(
                  children: [
                    // Jordan 1 Retro High Tie Dye
                    //Nike . Red Grey . 40
                    // $235,00

                    Container(
                      height: 90,
                      width: 90,
                      color: AppColor.gray,
                      child: Image.asset(CustomImageGetter.nikeyS1),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jordan 1 Retro High Tie Dye",
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                  ),
                        ),
                        Text(
                          'Nike . Red Grey . 40',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.black,
                                  ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$ 235,00",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.black,
                                  ),
                            ),
                            SizedBox(
                              width: sizewidth(context) * 0.2,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: decrement,
                                    icon: Icon(
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
                                    icon: Icon(
                                      Icons.add_circle_outlined,
                                      color: AppColor.primary1,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
