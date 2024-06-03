import 'package:flutter/material.dart';

import '../barrels/resources.dart';

class ProfileExpansionTile extends StatelessWidget {

  final String title;
  final String leadingImagePath;
  final bool isExpanded;
  final int position;
  final Function(int) onExpansionChanged;
  final List<Widget>? children;

  const ProfileExpansionTile({Key? key, required this.title, required this.leadingImagePath, required this.isExpanded, required this.position,
    required this.onExpansionChanged, this.children = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        dense: true,
        horizontalTitleGap: 17,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        child: ExpansionTile(
          maintainState: true,
          leading: Image.asset(leadingImagePath,
            height: 22,
            width: 17,
            fit: BoxFit.contain,
          ),
          tilePadding: EdgeInsets.only(left: 2, right: 6),
          title: Text(title,
            style: TextStyles.hintStyle.copyWith(
              color: kBlack,
            ),
          ),
          trailing: RotationTransition(
            turns: AlwaysStoppedAnimation((isExpanded ? 90 : 0) / 360),
            child: Icon(Icons.arrow_forward_ios_outlined, size: 18, color: kSilverGrey),
          ),
          onExpansionChanged: (expanded) => onExpansionChanged(position),
          children: children!,
        ),
      ),
    );
  }
}
