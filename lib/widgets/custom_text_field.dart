import 'package:flutter/material.dart';

import '../barrels/resources.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final int? minLines, maxLines;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText, enabled;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final TextAlign? textAlign;
  final int? maxLength;
  final String prefixImagePath;

  const CustomTextField({Key? key, required this.controller, this.inputType = TextInputType.text, this.inputAction = TextInputAction.next, this.validator,
    required this.hintText, this.obscureText = false, this.suffixIcon, this.enabled = true, this.minLines, this.maxLines, this.onChanged,
    this.textAlign = TextAlign.left, this.maxLength, required this.prefixImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.maxFinite,
      child: TextFormField(
        scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        enabled: enabled,
        controller: controller,
        minLines: minLines,
        maxLines: obscureText ? 1 : maxLines,
        keyboardType: inputType,
        textInputAction: inputAction,
        autofocus: false,
        obscureText: obscureText,
        validator: validator,
        style: TextStyles.hintStyle.copyWith(
          color: Colors.black,
        ),
        textAlign: textAlign!,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyles.hintStyle,
          prefixIcon: Container(
            margin: const EdgeInsets.fromLTRB(23, 20, 16, 20),
            child: Image.asset(prefixImagePath,
              height: 20,
              width: 19,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 61,
          ),
          suffixIcon: suffixIcon,
          suffixIconConstraints: BoxConstraints(
            maxHeight: 61,
          ),
          errorStyle: TextStyles.errorStyle,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          filled: true,
          fillColor: Colors.white70,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.blueGrey.withOpacity(.12),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}