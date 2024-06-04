import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/controller/auth_controller.dart';

class HomeController extends GetxController {

  var activeIndex = 0.obs;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final _authController = Get.find<AuthController>();

  @override
  void onInit() {
    setAuthUserAccountName();
    super.onInit();
  }

  void updateActiveIndex(int index) => activeIndex.value = index;

  void setAuthUserAccountName() {
    firstNameController.text = _authController.authUser.value!.firstName!;
    lastNameController.text = _authController.authUser.value!.lastName!;
  }
}