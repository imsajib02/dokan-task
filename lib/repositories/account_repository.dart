import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../barrels/localizations.dart';
import '../barrels/utils.dart';
import '../pages/auth/controller/auth_controller.dart';

class AccountRepository {

  Future<http.Response> updateAccountInfo(String firstName, String lastName) async {

    var result = await Connectivity().checkConnectivity();

    if(result != ConnectivityResult.mobile && result != ConnectivityResult.wifi)
      throw NoInternetException(message: STR_NO_INTERNET.tr);

    var networkStatus = await InternetConnectionChecker().isHostReachable(options);

    if(!networkStatus.isSuccess)
      throw BadConnectionException(message: STR_INACTIVE_CONNECTION.tr);

    showProgressIndicator();

    var client = http.Client();

    String url = dotenv.env['API_URL']! + dotenv.env['UPDATE_ACCOUNT']!;

    Map<String, dynamic> body = {};

    if(firstName.isNotEmpty) {
      body['first_name'] = firstName;
    }

    if(lastName.isNotEmpty) {
      body['last_name'] = lastName;
    }

    final authController = Get.find<AuthController>();

    try {
      var response = await client.post(Uri.parse(url),
        body: body,
        headers: {"Authorization" : "Bearer ${authController.authUser.value!.accessToken}", "Accept" : "application/json"},
      ).timeout(Duration(seconds: timeoutSeconds));

      client.close();
      Get.back(closeOverlays: true);

      return response;

    } on TimeoutException {

      client.close();
      Get.back(closeOverlays: true);

      throw ConnectionTimedOutException(message: STR_TIMED_OUT.tr);

    } catch(error) {

      client.close();
      Get.back(closeOverlays: true);

      throw BadRequestException(message: STR_UNKNOWN_ERROR.tr);
    }
  }
}