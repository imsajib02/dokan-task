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
      'username': 'Username',
      'confirm_password': 'Confirm Password',
      'already_signup': 'Already have an account?',
      'signup': 'Sign Up',
      'required': 'Field is required!',
      'invalid_email': 'Invalid email address!',
      'must_be_6_char': 'Must be 6 character long!',
      'confirm_password_mismatch': 'Confirm password does not match!',
    },
    'bn_BD': {
      'app_name': 'দোকান',
    }
  };
}