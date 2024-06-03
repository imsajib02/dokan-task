import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'barrels/localizations.dart';
import 'barrels/utils.dart';
import 'pages/auth/controller/auth_controller.dart';
import 'route/routes.dart';
import 'theme/app_theme.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await GetStorage.init(dotenv.env['STORAGE_PREF']!);

  registerServices();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  final _controller = Get.put(AuthController());

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(() => GetMaterialApp(
      title: dotenv.env['APP_TITLE']!,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.native,
      translations: AppLocalization(),
      locale: LOCALE_ENGLISH,
      fallbackLocale: LOCALE_ENGLISH,
      initialRoute: _controller.authUser.value == null ? ROUTE_LOGIN : ROUTE_HOME,
      getPages: appPages,
    ));
  }
}
