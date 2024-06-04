import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../barrels/pages.dart';
import '../../barrels/resources.dart';
import '../../barrels/widgets.dart';
import 'controller/home_controller.dart';

class Home extends StatelessWidget {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final _controller = Get.put(HomeController());

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future(() => false);
      },
      child: Obx(() => SafeArea(
        child: Scaffold(
          floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Material(
              elevation: 2,
              shape: CircleBorder(),
              child: Container(
                height: 56,
                width: 56,
                padding: const EdgeInsets.symmetric(vertical: 14.65, horizontal: 14.44),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.5, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                    colors: <Color>[
                      kRosePink,
                      kRedOrange,
                    ],
                  ),
                ),
                child: FittedBox(
                  child: Icon(Icons.search, color: kWhite),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: 4,
            elevation: 4,
            backgroundColor: kWhite,
            activeIndex: _controller.activeIndex.value,
            splashColor: Theme.of(context).primaryColor,
            splashSpeedInMilliseconds: 300,
            notchSmoothness: NotchSmoothness.defaultEdge,
            gapLocation: GapLocation.center,
            rightCornerRadius: 15,
            leftCornerRadius: 15,
            onTap: (index) {},
            tabBuilder: (int index, bool isActive) {

              return IndexedStack(
                index: index,
                children: [

                  CustomBottomBarItem(
                    imagePath: 'assets/images/home.png',
                    indexPosition: 0,
                    activeIndex: _controller.activeIndex.value,
                    onTap: (index) => _controller.updateActiveIndex(index),
                  ),

                  CustomBottomBarItem(
                    imagePath: 'assets/images/categories.png',
                    indexPosition: 1,
                    activeIndex: _controller.activeIndex.value,
                    onTap: (index) => _controller.updateActiveIndex(index),
                  ),

                  CustomBottomBarItem(
                    imagePath: 'assets/images/cart.png',
                    indexPosition: 2,
                    activeIndex: _controller.activeIndex.value,
                    onTap: (index) => _controller.updateActiveIndex(index),
                  ),

                  CustomBottomBarItem(
                    imagePath: 'assets/images/account.png',
                    indexPosition: 3,
                    activeIndex: _controller.activeIndex.value,
                    onTap: (index) => _controller.updateActiveIndex(index),
                  ),
                ],
              );
            },
          ),
          body: Builder(
            builder: (BuildContext context) {

              return IndexedStack(
                index: _controller.activeIndex.value,
                children: [

                  Products(),

                  Container(),

                  Container(),

                  MyAccount(
                    firstNameController: _firstNameController,
                    lastNameController: _lastNameController,
                  ),
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}