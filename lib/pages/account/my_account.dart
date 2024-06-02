import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/localizations.dart';
import '../../barrels/widgets.dart';

class MyAccount extends StatelessWidget {

  MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: STR_MY_ACCOUNT.tr,
        ),
      ),
    );
  }
}
