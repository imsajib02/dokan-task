import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
              child: Icon(Icons.search, size: 30, color: kDarkBlue),
            ),
          ],
        ),
        body: Obx(() => CustomScrollView(
          slivers: [

            MultiSliver(
              children: [

                SliverPinnedHeader(
                  child: _buildFilterView(context),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [

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
                          padding: const EdgeInsets.symmetric(vertical: 20),
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
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildFilterView(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Get.bottomSheet(_buildFilterOptionBottomSheet(context)),
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 21, 10.9, 21),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kWhite,
            boxShadow: [
              const BoxShadow(
                color: kGreyish,
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
                    margin: const EdgeInsets.fromLTRB(0, 1, 11, 1),
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
                        margin: const EdgeInsets.fromLTRB(0, 0, 8.2, 0),
                        child: Text(STR_SORT_BY.tr,
                          style: TextStyles.filterTextStyle,
                        ),
                      ),

                      SizedBox(
                        width: 13.5,
                        height: 7.6,
                        child: Icon(Icons.keyboard_arrow_down_outlined, color: kOsloGrey),
                      ),
                    ],
                  ),

                  25.w,

                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 2.3, 0, 1.8),
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
        ),
      ),
    );
  }

  Widget _buildFilterOptionBottomSheet(BuildContext context) {

    return Container(
      color: kWhite,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 27,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            height: 3,
            width: 47,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.35),
              borderRadius: BorderRadius.circular(1),
            ),
          ),

          19.h,

          Align(
            alignment: Alignment.centerLeft,
            child: Text(STR_FILTER.tr,
              style: TextStyles.accountUpdateButtonStyle.copyWith(
                fontFamily: 'Roboto'
              ),
            ),
          ),

          17.h,

          Obx(() => Flexible(
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 70),
              children: _controller.filterOptions.map((option) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                checkColor: kWhite,
                activeColor: Theme.of(context).primaryColor,
                side: BorderSide(
                  width: 1.25,
                  color: Theme.of(context).primaryColor,
                ),
                visualDensity: VisualDensity(
                  horizontal: -4,
                ),
                dense: true,
                title: Text(option.title,
                  style: TextStyles.filterOptionTitleStyle,
                ),
                value: option.isChecked,
                onChanged: (value) {

                  if(value == null) return;

                  _controller.updateFilterOptionCheckedStatus(option, value);
                },
              )).toList(),
            ),
          )),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Expanded(
                flex: 1,
                child: AccountUpdateButton(
                  text: STR_CANCEL.tr,
                  textColor: kJetGrey,
                  backgroundColor: kWhite,
                  borderColor: kGrey,
                  onTap: () => Get.back(closeOverlays: true),
                ),
              ),

              20.w,

              Expanded(
                flex: 1,
                child: AccountUpdateButton(
                  text: STR_APPLY.tr,
                  textColor: kWhite,
                  backgroundColor: kTopazGreen,
                  borderColor: kTopazGreen,
                  onTap: () {},
                ),
              ),
            ],
          ),

          4.h,
        ],
      ),
    );
  }
}
