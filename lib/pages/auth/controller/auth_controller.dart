import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

import '../../../barrels/localizations.dart';
import '../../../barrels/models.dart';
import '../../../barrels/repositories.dart';
import '../../../barrels/utils.dart';
import '../../../barrels/widgets.dart';
import '../../../route/routes.dart';

class AuthController extends GetxController {

  var isPasswordVisible = false.obs;
  var authUser = Rxn<User>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _authRepo = getIt<AuthRepository>();
  var _myPref = getIt<MyPref>();

  @override
  void onInit() {
    getAuthUser();
    super.onInit();
  }

  void getAuthUser() {
    authUser.value = _myPref.getAuthUser();
  }

  void togglePasswordVisibility() => isPasswordVisible.toggle();

  void validateSignupForm(User user) {

    if(formKey.currentState!.validate()) {
      _signup(user);
    }
  }

  void validateLoginForm(User user) {

    if(formKey.currentState!.validate()) {
      _login(user);
    }
  }

  Future<void> _signup(User user) async {

    try {
      var response = await _authRepo.createUserAccount(user);

      var jsonData = json.decode(response.body);

      if((response.statusCode == HttpStatus.ok || response.statusCode == HttpStatus.created || response.statusCode == HttpStatus.accepted)
        && jsonData['code'] == HttpStatus.ok) {

        showSnackBar(STR_SUCCESS.tr, jsonData['message']);
        return;
      }

      showSnackBar(STR_FAILED.tr, jsonData['message'], isErrorMsg: true);

    } on AppException catch(error) {
      showSnackBar(STR_FAILED.tr, error.message!, isErrorMsg: true);

    } catch(error) {
      showSnackBar(STR_FAILED.tr, STR_UNKNOWN_ERROR.tr, isErrorMsg: true);
    }
  }

  Future<void> _login(User user) async {

    try {
      var response = await _authRepo.signInUser(user);

      var jsonData = json.decode(response.body);

      if(response.statusCode == HttpStatus.ok) {

        saveAuthUser(User.fromJson(jsonData));
        Get.offNamed(ROUTE_HOME);
        return;
      }

      showSnackBar(STR_FAILED.tr, _parseHtmlString(jsonData['message']), isErrorMsg: true);

    } on AppException catch(error) {
      showSnackBar(STR_FAILED.tr, error.message!, isErrorMsg: true);

    } catch(error) {
      showSnackBar(STR_FAILED.tr, STR_UNKNOWN_ERROR.tr, isErrorMsg: true);
    }
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;
    return parsedString;
  }

  void saveAuthUser(User user) {
    authUser.value = user;
    _myPref.saveAuthUser(authUser.value!);
  }
}