import 'package:flutter/material.dart';

import '../barrels/utils.dart';
import '../barrels/resources.dart';

class AccountUpdateField extends StatelessWidget {

  final String title;
  final Function(String) onInputChanged;

  const AccountUpdateField({Key? key, required this.title, required this.onInputChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Opacity(
          opacity: 0.56,
          child: Text(title,
            style: TextStyles.accountTextFieldTitleStyle,
          ),
        ),

        12.h,

        TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          style: TextStyles.hintStyle.copyWith(
            color: kBlack,
          ),
          textAlign: TextAlign.left,
          onChanged: (value) => onInputChanged(value),
          decoration: InputDecoration(
            errorStyle: TextStyles.errorStyle,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: kGreyish),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kGreyishBlue),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kGreyish),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
