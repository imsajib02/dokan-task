import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../barrels/resources.dart';

void showProgressIndicator() => Get.dialog(
  Center(
    child: Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Lottie.asset('assets/animations/sending.json'),
    ),
  ),
  barrierDismissible: false,
);

void showSnackBar(String title, message, {bool isErrorMsg = false}) {

  Get.snackbar(title, message,
    margin: const EdgeInsets.all(15),
    duration: const Duration(milliseconds: 3500),
    colorText: isErrorMsg ? kWhite : null,
    backgroundColor: isErrorMsg ? kRedOrange : null,
  );
}