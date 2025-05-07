import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:flutter_task/core/presentation/utils/generated/generated_assets/assets.gen.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    super.key,
    required this.userName,
    this.image,
  });
  final String userName;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              //TODO will naviget to setting page
            },
            child: Assets.icons.settingsIcon.svg(),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              //TODO will naviget to notification page or show notification in drop drow  layout
            },
            child: Assets.icons.notification.svg(),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        VerticalDivider(
          color: context.appColor.dividerColor,
          endIndent: 16,
          indent: 16,
        ),
        const SizedBox(
          width: 24,
        ),
        CircleAvatar(
          child: CircleAvatar(
            radius: 16,
            backgroundColor: context.appColor.secondaryColor,
            child:
                // image != null  ? //will be implementation to image to represent it   :

                Center(
              child: Text(
                userName.characters.first,
                style: context.textTheme.titleMedium,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        SizedBox(
          width: 60,
          child: Tooltip(
            message: userName,
            child: Text(
              userName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: context.textTheme.titleMedium,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        GestureDetector(
          onTap: () {
            //TODO expand this arrow and show some options
          },
          child: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.appColor.whiteColor,
          ),
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }
}
