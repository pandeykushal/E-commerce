import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: sizewidth(context) * 0.07),
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
