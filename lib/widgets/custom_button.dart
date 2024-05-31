import 'package:flutter/material.dart';

import '../barrels/resources.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function() onTap;

  const CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 61,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,
            style: TextStyles.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
