import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/resources.dart';
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
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

                _buildFilterView(),

                30.h,

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

                30.h,
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildFilterView() {

    return Container(
      padding: EdgeInsets.fromLTRB(20, 21, 10.9, 21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A395AB8),
            offset: Offset(0, 3),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                margin: EdgeInsets.fromLTRB(0, 1, 11, 1),
                child: Image.asset('assets/images/filter.png',
                  height: 15,
                  width: 16,
                  fit: BoxFit.fill,
                ),
              ),

              Text(STR_FILTER.tr,
                style: TextStyles.filterTextStyle,
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 8.2, 0),
                    child: Text(STR_SORT_BY.tr,
                      style: TextStyles.filterTextStyle,
                    ),
                  ),

                  SizedBox(
                    width: 13.5,
                    height: 7.6,
                    child: Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xFF818995)),
                  ),
                ],
              ),

              25.w,

              Container(
                margin: EdgeInsets.fromLTRB(0, 2.3, 0, 1.8),
                width: 18.9,
                height: 13.9,
                child: Image.asset('assets/images/menu.png',
                  width: 18.9,
                  height: 13.9,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
