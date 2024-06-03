import 'package:flutter/material.dart';

import '../barrels/resources.dart';

class AccountUpdateButton extends StatelessWidget {

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final Function() onTap;

  const AccountUpdateButton({Key? key, required this.text, required this.backgroundColor, required this.textColor,
    required this.borderColor, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(0.8, 15, 0, 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(text,
            style: TextStyles.accountUpdateButtonStyle.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
