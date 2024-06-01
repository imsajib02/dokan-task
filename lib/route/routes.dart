import 'package:get/get.dart';

import '../barrels/pages.dart';

const String ROUTE_INITIAL = '/';
const String ROUTE_SIGNUP = '/signup';

final appPages = <GetPage>[

  GetPage(name: ROUTE_INITIAL, page: () => Login()),
  GetPage(name: ROUTE_SIGNUP, page: () => Signup()),
];