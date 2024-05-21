import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:np_com_pandeykushal/view/export_view.dart';
import 'package:provider/provider.dart';
import '../../view_model/providers/export_provider.dart';
import '../../view_model/utils/export_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  static const String routeName = "/basepage";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const BasePage());
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = List.generate(
      20,
      (index) => {
        'title': 'Jordan 1 Retro High Tie Dye',
        'rating': '4.5',
        'reviews': '1045 Reviews',
        'price': '\$ 235,00',
        'image': CustomImageGetter.nikeyS1,
        'icon': CustomImageGetter.nikey,
      },
    );
    return SafeArea(
      child: Consumer<HomeProvider>(builder: (context, baseProv, child) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            bottomSheet: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(vertical: 10),
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
                  // SvgPicture.asset(
                  //   CustomImageGetter.filter,
                  //   color: AppColor.white,
                  //   height: 18,
                  // ),
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
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: sizewidth(context) * 0.07),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Discover",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColor.black,
                              ),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          CustomImageGetter.cart,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),

                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.72,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return InkWell(
                          onTap: () {
                            context.push(ProductDetail.routeName);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: AppColor.lightgray,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 15, 15, 0),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            product['icon']!,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
                                      child: Image.asset(
                                        product['image']!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                product['title']!,
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
                                  Icon(
                                    Icons.star_purple500_outlined,
                                    color: Colors.amber,
                                  ),
                                  Text(
                                    product['rating']!,
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
                                    '(${product['reviews']!})',
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
                                product['price']!,
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
                    ),

                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //       width: 150,
                    //       height: 150,
                    //       decoration: const BoxDecoration(
                    //           color: AppColor.lightgray,
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(20))),
                    //       child: Column(
                    //         children: [
                    //           Padding(
                    //             padding:
                    //                 const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    //             child: Row(
                    //               children: [
                    //                 SvgPicture.asset(
                    //                   CustomImageGetter.nikey,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding:
                    //                 const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    //             child: Image.asset(CustomImageGetter.nikeyS1),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       height: 10,
                    //     ),
                    //     Text(
                    //       "Jordan 1 Retro High Tie Dye",
                    //       style:
                    //           Theme.of(context).textTheme.labelLarge?.copyWith(
                    //                 fontWeight: FontWeight.w400,
                    //                 color: AppColor.black,
                    //               ),
                    //     ),
                    //     Row(
                    //       children: [
                    //         Icon(
                    //           Icons.star_purple500_outlined,
                    //           color: Colors.amber,
                    //         ),
                    //         Text(
                    //           "4.5",
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .labelMedium
                    //               ?.copyWith(
                    //                 fontWeight: FontWeight.w700,
                    //                 color: AppColor.black,
                    //               ),
                    //         ),
                    //         const SizedBox(
                    //           width: 5,
                    //         ),
                    //         Text(
                    //           "(1045 Reviews)",
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .labelLarge
                    //               ?.copyWith(
                    //                 fontWeight: FontWeight.w400,
                    //                 color: AppColor.black,
                    //               ),
                    //         ),
                    //       ],
                    //     ),
                    //     Text(
                    //       "\$ 235,00",
                    //       style:
                    //           Theme.of(context).textTheme.titleSmall?.copyWith(
                    //                 fontWeight: FontWeight.w700,
                    //                 color: AppColor.black,
                    //               ),
                    //     ),
                    //   ],
                    // ),

                    // TabBar(
                    //   tabAlignment: TabAlignment.center,
                    //   onTap: (index) {
                    //     baseProv.setIndex(index);
                    //   },
                    //   tabs: const [
                    //     Tab(
                    //       text: 'All',
                    //     ),
                    //     Tab(text: 'Nike'),
                    //     Tab(text: 'Jordan'),
                    //     Tab(text: 'Adidas'),
                    //     Tab(text: 'Reebok'),
                    //   ],
                    //   indicatorColor: Colors.transparent,
                    //   labelColor: Colors.black,
                    //   unselectedLabelColor: Colors.grey,
                    //   isScrollable: true,
                    //   labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    //         fontWeight: FontWeight.w700,
                    //         color: AppColor.black,
                    //       ),
                    //   unselectedLabelStyle:
                    //       Theme.of(context).textTheme.bodySmall?.copyWith(
                    //             fontWeight: FontWeight.w700,
                    //             color: AppColor.gray,
                    //           ),
                    // ),
                    // Expanded(
                    //   child: TabBarView(
                    //     children: [
                    //       Center(child: Text('All')),
                    //       Center(child: Text('Nike')),
                    //       Center(child: Text('Jordan')),
                    //       Center(child: Text('Adidas')),
                    //       Center(child: Text('Reebok')),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
