import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../barrels/localizations.dart';
import '../../barrels/resources.dart';
import '../../barrels/utils.dart';
import '../../barrels/widgets.dart';

class Signup extends StatelessWidget {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Signup({Key? key}) : super(key: key);

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
            child: Container(
              margin: EdgeInsets.only(bottom: 54),
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [

                  52.h,

                  SizedBox(
                    height: 121,
                    width: 121,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [

                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 121,
                            width: 121,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x1A395AB8),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),

                        Image.asset('assets/images/person.png',
                          height: 31,
                          width: 25,
                        ),

                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x1A395AB8),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: SizedBox(
                              height: 20,
                              width: 23,
                              child: Icon(Icons.camera_alt,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  52.h,

                  CustomTextField(
                    controller: _nameController,
                    hintText: STR_NAME.tr,
                    inputType: TextInputType.text,
                    prefixImagePath: 'assets/images/person.png',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),

                  19.h,

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
                  ),

                  19.h,

                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: STR_CONFIRM_PASSWORD.tr,
                    inputType: TextInputType.visiblePassword,
                    obscureText: true,
                    prefixImagePath: 'assets/images/lock.png',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 19,
                    ),
                  ),

                  78.h,

                  CustomButton(
                    text: STR_SIGNUP.tr,
                    onTap: () {},
                  ),

                  39.h,

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

                  53.h,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(STR_ALREADY_SIGNED.tr,
                        style: TextStyles.hintStyle.copyWith(
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF383C40),
                        ),
                      ),

                      8.w,

                      Text(STR_LOGIN.tr,
                        style: TextStyles.hintStyle.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2893E3),
                        ),
                      ),
                    ],
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
