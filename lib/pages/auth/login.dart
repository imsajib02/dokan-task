import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/localizations.dart';
import '../../barrels/resources.dart';
import '../../barrels/utils.dart';
import '../../barrels/widgets.dart';

class Login extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
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
                    controller: _emailController,
                    hintText: STR_EMAIL.tr,
                    inputType: TextInputType.emailAddress,
                    prefixImagePath: 'assets/images/email.png',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),

                  19.h,

                  CustomTextField(
                    controller: _passwordController,
                    hintText: STR_PASSWORD.tr,
                    inputType: TextInputType.visiblePassword,
                    obscureText: true,
                    prefixImagePath: 'assets/images/lock.png',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 19,
                    ),
                    suffixIcon: Container(
                      margin: EdgeInsets.fromLTRB(30, 21, 23, 19),
                      child: SizedBox(
                        height: 20,
                        width: 23,
                        child: Icon(Icons.visibility_off,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

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
                    onTap: () {},
                  ),

                  40.h,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      socialLoginButton(
                        imagePath: 'assets/images/facebook.png',
                      ),

                      14.w,

                      socialLoginButton(
                        imagePath: 'assets/images/google.png',
                      ),
                    ],
                  ),

                  52.h,

                  Text(STR_CREATE_NEW_ACCOUNT.tr,
                    style: TextStyles.hintStyle.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF383C40),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget socialLoginButton({required String imagePath}) {

    return Container(
      width: 56,
      height: 56,
      child: IconButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        icon: Container(
          width: 56,
          height: 56,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFFFFFFF),
            boxShadow: [
              BoxShadow(
                color: Color(0x1A395AB8),
                offset: Offset(0, 3),
                blurRadius: 2,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Image.asset(imagePath,
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
