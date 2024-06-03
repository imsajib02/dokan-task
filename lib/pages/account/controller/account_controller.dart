import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../barrels/localizations.dart';
import '../../../barrels/models.dart';
import '../../../barrels/repositories.dart';
import '../../../barrels/utils.dart';
import '../../auth/controller/auth_controller.dart';

class AccountController extends GetxController {

  var isExpanded = [false, false, false, false].obs;

  final _authController = Get.find<AuthController>();
  final _accountRepo = getIt<AccountRepository>();

  void toggleExpansionStatus(int position) => isExpanded[position] = !isExpanded[position];

  Future<void> updateAccountInfo({required String firstName, required String lastName}) async {

    if(firstName.isNotEmpty || lastName.isNotEmpty) {

      try {
        var response = await _accountRepo.updateAccountInfo(firstName, lastName);

        var jsonData = json.decode(response.body);

        if(response.statusCode == HttpStatus.ok) {

          User user = _authController.authUser.value!;

          user..firstName = jsonData['first_name']
            ..lastName = jsonData['last_name'];

          _authController.saveAuthUser(user);
          _showSnackBar(STR_UPDATE_SUCCESS.tr, jsonData['message']);
          return;
        }

        _showSnackBar(STR_FAILED.tr, jsonData['message'], isErrorMsg: true);

      } on AppException catch(error) {
        _showSnackBar(STR_FAILED.tr, error.message!, isErrorMsg: true);

      } catch(error) {
        _showSnackBar(STR_FAILED.tr, STR_UNKNOWN_ERROR.tr, isErrorMsg: true);
      }
    }
  }

  void _showSnackBar(String title, message, {bool isErrorMsg = false}) {

    Get.snackbar(title, message,
      margin: EdgeInsets.all(15),
      duration: const Duration(milliseconds: 3500),
      colorText: isErrorMsg ? Colors.white : null,
      backgroundColor: isErrorMsg ? Colors.redAccent : null,
    );
  }
}