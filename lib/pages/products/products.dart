import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/utils.dart';
import '../../barrels/localizations.dart';
import '../../barrels/widgets.dart';
import 'controller/product_controller.dart';

class Products extends StatelessWidget {

  final _controller = Get.put(ProductController());

  Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: STR_PRODUCT_LIST.tr,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Icon(Icons.search, size: 30, color: Color(0xFF222455)),
            ),
          ],
        ),
        body: Obx(() => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [

                20.h,

                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _controller.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: .6,
                  ),
                  itemBuilder: (context, index) {

                    return ProductItem(
                      product: _controller.productList[index],
                    );
                  },
                ),

                50.h,
              ],
            ),
          ),
        )),
      ),
    );
  }
}
