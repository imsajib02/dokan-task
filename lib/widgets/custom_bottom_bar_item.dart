import 'package:flutter/material.dart';

class CustomBottomBarItem extends StatelessWidget {

  final String imagePath;
  final int indexPosition;
  final int activeIndex;
  final Function(int) onTap;

  const CustomBottomBarItem({Key? key, required this.imagePath, required this.indexPosition, required this.onTap, required this.activeIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(indexPosition),
      child: Center(
        child: Image.asset(imagePath,
          height: 22,
          width: 22,
          color: indexPosition == activeIndex ? Theme.of(context).primaryColor : Color(0xFF6E7FAA),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
