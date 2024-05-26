// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:np_com_pandeykushal/view/export_view.dart';
import 'package:np_com_pandeykushal/view/screens/cart/cartScreen.dart';
import 'package:provider/provider.dart';
import '../../view_model/providers/export_provider.dart';
import '../../view_model/utils/export_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  static const String routeName = "/basepage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const BasePage());
  }

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late Future<void> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _fetchProducts();
  }

  Future<void> _fetchProducts() {
    return Provider.of<HomeProvider>(context, listen: false).fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomeProvider>(builder: (context, baseProv, child) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            bottomSheet: InkWell(
              onTap: () {
                context.push(FilterScreen.routeName);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: sizewidth(context) * 0.3,
                height: sizeHeight(context) * 0.048,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 26,
                          width: 16,
                          child: SvgPicture.asset(
                            CustomImageGetter.filter,
                            // ignore: deprecated_member_use
                            color: AppColor.white,
                            height: 16,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColor.pink,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Filter",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: AppColor.white,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: sizewidth(context) * 0.07),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Discover",
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.black,
                                ),
                      ),
                      const Spacer(),
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
                  const SizedBox(
                    height: 24,
                  ),
                  TabBar(
                    tabAlignment: TabAlignment.center,
                    onTap: (index) {
                      baseProv.setIndex(index);
                    },
                    tabs: const [
                      Tab(
                        text: 'All',
                      ),
                      Tab(text: 'Nike'),
                      Tab(text: 'Jordan'),
                      Tab(text: 'Adidas'),
                      Tab(text: 'Reebok'),
                    ],
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColor.black,
                        ),
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.gray,
                            ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(
                            child: FutureBuilder<void>(
                          future: _productFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else {
                              return GridView.builder(
                                shrinkWrap: true,
                                primary: false,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.72,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: baseProv.product.length,
                                itemBuilder: (context, index) {
                                  final product = baseProv.product[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetail(product: product),
                                        ),
                                      );
                                      // context.push(ProductDetail.routeName,
                                      //     extra: product);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            color: AppColor.lightgray,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 15, 15, 0),
                                                child: Row(
                                                  children: [
                                                    Image.network(
                                                      product.brandIcon ?? "",
                                                      height: 20,
                                                      width: 20,
                                                    )
                                                    // SvgPicture.asset(
                                                    //   product.brandIcon ?? "",
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15, 0, 15, 0),
                                                child: Image.network(
                                                  product.imageLarge ??
                                                      "https://firebasestorage.googleapis.com/v0/b/e-com-fb380.appspot.com/o/airJordan.png?alt=media&token=db277e1b-56e6-48a0-b44f-f77400ff699a",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
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
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                              size: 15,
                                            ),
                                            Text(
                                              product.avgRating.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColor.black,
                                                  ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "${product.totalRating ?? ""} reviews",
                                              // '(${product['reviews']!})',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColor.black,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          product.price.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: AppColor.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        )),
                        const Center(child: Text('Nike')),
                        const Center(child: Text('Jordan')),
                        const Center(child: Text('Adidas')),
                        const Center(child: Text('Reebok')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
