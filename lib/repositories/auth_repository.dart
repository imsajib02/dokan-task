import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../barrels/localizations.dart';
import '../barrels/models.dart';
import '../barrels/utils.dart';

class AuthRepository {

  Future<http.Response> createUserAccount(User user) async {

    var result = await Connectivity().checkConnectivity();

    if(result != ConnectivityResult.mobile && result != ConnectivityResult.wifi)
      throw NoInternetException(message: STR_NO_INTERNET.tr);

    var networkStatus = await InternetConnectionChecker().isHostReachable(options);

    if(!networkStatus.isSuccess)
      throw BadConnectionException(message: STR_INACTIVE_CONNECTION.tr);

    showProgressIndicator();

    var client = http.Client();

    String url = dotenv.env['API_URL']! + dotenv.env['SIGNUP']!;

    try {
      var response = await client.post(Uri.parse(url),
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type' : 'application/json', 'Accept' : 'application/json'},
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

  Future<http.Response> signInUser(User user) async {

    var result = await Connectivity().checkConnectivity();

    if(result != ConnectivityResult.mobile && result != ConnectivityResult.wifi)
      throw NoInternetException(message: STR_NO_INTERNET.tr);

    var networkStatus = await InternetConnectionChecker().isHostReachable(options);

    if(!networkStatus.isSuccess)
      throw BadConnectionException(message: STR_INACTIVE_CONNECTION.tr);

    showProgressIndicator();

    var client = http.Client();

    String url = dotenv.env['API_URL']! + dotenv.env['SIGNIN']!;

    try {
      var response = await client.post(Uri.parse(url),
        body: user.toJson(),
        headers: {'Content-Type' : 'application/x-www-form-urlencoded', 'Accept' : 'application/json'},
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