import 'package:flutter/material.dart';

import '../barrels/resources.dart';

class SocialButton extends StatelessWidget {

  final String imagePath;

  const SocialButton({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 56,
      height: 56,
      child: IconButton(
        onPressed: () {},
        padding: EdgeInsets.zero,
        icon: Container(
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kWhite,
            boxShadow: [
              const BoxShadow(
                color: kGreyish,
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
