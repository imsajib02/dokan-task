import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/localizations.dart';
import '../../barrels/models.dart';
import '../../barrels/resources.dart';
import '../../barrels/utils.dart';
import '../../barrels/widgets.dart';
import '../../route/routes.dart';
import 'controller/auth_controller.dart';

class Login extends StatelessWidget {

  final _controller = Get.find<AuthController>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 58,
                ),
                child: Column(
                  children: [

                    24.h,

                    Image.asset('assets/images/dokan.png',
                      height: 50,
                      width: 165,
                    ),

                    84.h,

                    Text(STR_SIGN_IN.tr,
                      style: TextStyles.headlineStyle,
                    ),

                    38.h,

                    CustomTextField(
                      controller: _usernameController,
                      hintText: STR_USERNAME.tr,
                      inputType: TextInputType.text,
                      prefixImagePath: 'assets/images/person.png',
                      validator: (value) {

                        if((value == null || value.isEmpty)) {
                          return STR_REQUIRED.tr;
                        }

                        return null;
                      },
                    ),

                    19.h,

                    Obx(() => CustomTextField(
                      controller: _passwordController,
                      hintText: STR_PASSWORD.tr,
                      inputType: TextInputType.visiblePassword,
                      obscureText: !_controller.isPasswordVisible.value,
                      prefixImagePath: 'assets/images/lock.png',
                      suffixIcon: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => _controller.togglePasswordVisibility(),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(30, 21, 23, 19),
                          child: SizedBox(
                            height: 20,
                            width: 23,
                            child: Icon(!_controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                              size: 20,
                              color: kGrey,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {

                        if((value == null || value.isEmpty)) {
                          return STR_REQUIRED.tr;
                        }

                        if(value.length < minPasswordLength) {
                          return STR_PASSWORD_LENGTH_SHORT.tr;
                        }

                        return null;
                      },
                    )),

                    18.h,

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(STR_FORGOT_PASSWORD.tr,
                        style: TextStyles.hintStyle.copyWith(
                          fontSize: 13,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),

                    59.h,

                    CustomButton(
                      text: STR_LOGIN.tr,
                      onTap: () => _controller.validateLoginForm(
                        User(
                          username: _usernameController.text,
                          password: _passwordController.text,
                        )
                      ),
                    ),

                    40.h,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SocialButton(
                          imagePath: 'assets/images/facebook.png',
                        ),

                        14.w,

                        SocialButton(
                          imagePath: 'assets/images/google.png',
                        ),
                      ],
                    ),

                    52.h,

                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Get.offNamed(ROUTE_SIGNUP),
                      child: Text(STR_CREATE_NEW_ACCOUNT.tr,
                        style: TextStyles.hintStyle.copyWith(
                          fontWeight: FontWeight.w300,
                          color: kGreyishBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
