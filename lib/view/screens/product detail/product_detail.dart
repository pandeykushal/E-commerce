import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../view_model/providers/export_provider.dart';
import '../../../view_model/utils/export_utils.dart';
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
            appBar: CustomAppBar(
              title: "",
              leading: Icon(
                Icons.arrow_back,
                size: 30,
              ),
              actions: [
                SvgPicture.asset(
                  CustomImageGetter.cart,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: sizewidth(context) * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      height: 95,
                      color: Colors.amber,
                      // child: ,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 95,
                      color: Colors.amber,
                      // child: ,
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
