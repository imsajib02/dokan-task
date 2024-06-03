import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';

import '../barrels/models.dart';

class MyPref {

  final _box = GetStorage(dotenv.env['STORAGE_PREF']!);

  static const AUTH = 'auth';

  void saveAuthUser(User user) => _box.write(AUTH, json.encode(user.toCache()));

  User? getAuthUser() {
    var authData = _box.read(AUTH);
    return authData == null ? null : User.fromJson(json.decode(authData as String));
  }
}