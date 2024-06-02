import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../barrels/widgets.dart';

class Home extends StatelessWidget {

  int _index = 0;

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future(() => false);
      },
      child: Scaffold(
        floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0,
          child: Material(
            elevation: 2,
            shape: CircleBorder(),
            child: Container(
              height: 56,
              width: 56,
              padding: EdgeInsets.symmetric(vertical: 14.65, horizontal: 14.44),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.5, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                  colors: <Color>[
                    Color(0xFFFF679B),
                    Color(0xFFFF7B51),
                  ],
                ),
              ),
              child: FittedBox(
                child: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: 4,
          elevation: 4,
          backgroundColor: Colors.white,
          activeIndex: _index,
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
                  activeIndex: _index,
                  onTap: (index) {},
                ),

                CustomBottomBarItem(
                  imagePath: 'assets/images/categories.png',
                  indexPosition: 1,
                  activeIndex: _index,
                  onTap: (index) {},
                ),

                CustomBottomBarItem(
                  imagePath: 'assets/images/cart.png',
                  indexPosition: 2,
                  activeIndex: _index,
                  onTap: (index) {},
                ),

                CustomBottomBarItem(
                  imagePath: 'assets/images/account.png',
                  indexPosition: 3,
                  activeIndex: _index,
                  onTap: (index) {},
                ),
              ],
            );
          },
        ),
        body: Builder(
          builder: (BuildContext context) {

            return Container();
          },
        ),
      ),
    );
  }
}