import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/localizations.dart';
import '../../barrels/widgets.dart';

class Products extends StatelessWidget {

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
        body: SingleChildScrollView(
          child: Column(
            children: [


            ],
          ),
        ),
      ),
    );
  }
}
