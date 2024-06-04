import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../barrels/utils.dart';
import '../../barrels/localizations.dart';
import '../../barrels/resources.dart';
import '../../barrels/widgets.dart';
import '../auth/controller/auth_controller.dart';
import 'controller/account_controller.dart';

class MyAccount extends StatelessWidget {

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  final _authController = Get.find<AuthController>();
  final _accountController = Get.put(AccountController());

  MyAccount({Key? key, required this.firstNameController, required this.lastNameController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: STR_MY_ACCOUNT.tr,
        ),
        body: Obx(() => SingleChildScrollView(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  _buildProfilePicture(),

                  40.h,

                  Text(_authController.authUser.value!.displayName!,
                    textAlign: TextAlign.center,
                    style: TextStyles.accountInfoTextStyle,
                  ),

                  7.h,

                  Text(_authController.authUser.value!.email!,
                    textAlign: TextAlign.center,
                    style: TextStyles.productInfoStyle,
                  ),

                  37.h,

                  _buildProfileSection(context),

                  37.h,
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildProfilePicture() {

    return DottedBorder(
      color: kRedOrange,
      strokeWidth: 1,
      dashPattern: [5, 5],
      borderType: BorderType.Circle,
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 112,
            width: 112,
            decoration: BoxDecoration(
              color: kGreyish,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 24),
      decoration: BoxDecoration(
        color: kWhite700,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(
            color: kGreyish,
            offset: Offset(2, 3),
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [

          ProfileExpansionTile(
            title: STR_ACCOUNT.tr,
            leadingImagePath: 'assets/images/person.png',
            position: 0,
            isExpanded: _accountController.isExpanded[0],
            onExpansionChanged: (position) => _accountController.toggleExpansionStatus(position),
            children: [

              22.h,

              AccountUpdateField(
                title: STR_FIRST_NAME.tr,
                controller: firstNameController,
              ),

              22.h,

              AccountUpdateField(
                title: STR_LAST_NAME.tr,
                controller: lastNameController,
              ),

              24.h,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    flex: 1,
                    child: AccountUpdateButton(
                      text: STR_CANCEL.tr,
                      textColor: kJetGrey,
                      backgroundColor: kWhite,
                      borderColor: kGrey,
                      onTap: () {},
                    ),
                  ),

                  20.w,

                  Expanded(
                    flex: 1,
                    child: AccountUpdateButton(
                      text: STR_SAVE.tr,
                      textColor: kWhite,
                      backgroundColor: kTopazGreen,
                      borderColor: kTopazGreen,
                      onTap: () => _accountController.updateAccountInfo(firstName: firstNameController.text, lastName: lastNameController.text),
                    ),
                  ),
                ],
              ),

              43.h,
            ],
          ),

          Divider(indent: 3, endIndent: 2),

          ProfileExpansionTile(
            title: STR_PASSWORDS.tr,
            leadingImagePath: 'assets/images/lock.png',
            position: 1,
            isExpanded: _accountController.isExpanded[1],
            onExpansionChanged: (position) => _accountController.toggleExpansionStatus(position),
          ),

          Divider(indent: 3, endIndent: 2),

          ProfileExpansionTile(
            title: STR_NOTIFICATION.tr,
            leadingImagePath: 'assets/images/notification.png',
            position: 2,
            isExpanded: _accountController.isExpanded[2],
            onExpansionChanged: (position) => _accountController.toggleExpansionStatus(position),
          ),

          Divider(indent: 3, endIndent: 2),

          ProfileExpansionTile(
            title: STR_WISHLIST.tr,
            leadingImagePath: 'assets/images/favourite.png',
            position: 3,
            isExpanded: _accountController.isExpanded[3],
            onExpansionChanged: (position) => _accountController.toggleExpansionStatus(position),
          ),
        ],
      ),
    );
  }
}
