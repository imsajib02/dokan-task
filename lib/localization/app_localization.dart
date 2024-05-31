import 'package:get/get.dart';

class AppLocalization extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {

    'en_US': {
      'app_name': 'Dokan',
      'sign_in': 'Sign In',
      'email': 'Email',
      'password': 'Password',
      'forgot_password': 'Forgot Password?',
      'login': 'Login',
      'create_new_account': 'Create New Account',
    },
    'bn_BD': {
      'app_name': 'দোকান',
    }
  };
}