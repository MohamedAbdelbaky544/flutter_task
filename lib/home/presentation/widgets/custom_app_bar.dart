import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:flutter_task/core/presentation/extensions/tr.dart';
import 'package:flutter_task/core/presentation/utils/generated/generated_assets/assets.gen.dart';
import 'package:flutter_task/core/presentation/utils/screen_utils.dart';
import 'package:flutter_task/home/domain/entities/enum/tab_items_eunm.dart';
import 'package:flutter_task/home/presentation/widgets/user_image_widget.dart';

AppBar customAppBar(
    {required BuildContext context, required TabController tabController}) {
  return switch (checkResponsive(context)) {
    ResponsiveUI.web => AppBar(
        surfaceTintColor: context.appColor.dividerColor,
        elevation: 2,
        leading: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Assets.icons.logo.svg(
              height: 40,
              width: 82,
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: context.appColor.dividerColor,
          ),
        ),
        leadingWidth: MediaQuery.sizeOf(context).width * 0.3,
        actions: [
          TabBar(
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) {
                  return context.appColor.secondaryColor; // Hover color
                }
                return null; // Default overlay
              },
            ),
            tabAlignment: TabAlignment.center,
            isScrollable: false,
            controller: tabController,
            dividerColor: Colors.transparent,
            indicatorColor: context.appColor.secondaryColor,
            labelStyle: context.textTheme.titleSmall,
            unselectedLabelColor: context.appColor.grey,
            labelPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            tabs: TabItems.values
                .map(
                  (e) => Tab(
                    text: context.translation.tabItems(e.name),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            width: 24,
          ),
          VerticalDivider(
            endIndent: 16,
            indent: 16,
            color: context.appColor.dividerColor,
          ),
          const SizedBox(
            width: 24,
          ),
          const UserImageWidget(
            userName:
                'Mohamed Abdelbaky', //TODO replace this with logged in user and path his image if it exist
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    ResponsiveUI.table => AppBar(
        title: Assets.icons.logo.svg(
          height: 40,
          width: 82,
        ),
        iconTheme: IconThemeData(
          color: context.appColor.whiteColor,
        ),
        actions: const [
          SizedBox(
            width: 24,
          ),
          UserImageWidget(
            userName:
                'Mohamed Abdelbaky', //TODO replace this with logged in user and path his image if it exist
          ),
        ],
        bottom: TabBar(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return context.appColor.secondaryColor; // Hover color
              }
              return null; // Default overlay
            },
          ),
          tabAlignment: TabAlignment.center,
          isScrollable: false,
          controller: tabController,
          dividerColor: Colors.transparent,
          indicatorColor: context.appColor.secondaryColor,
          labelStyle: context.textTheme.titleSmall,
          unselectedLabelColor: context.appColor.grey,
          labelPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          tabs: TabItems.values
              .map(
                (e) => Tab(
                  text: context.translation.tabItems(e.name),
                ),
              )
              .toList(),
        ),
      ),
    _ => AppBar(
        title: Assets.icons.logo.svg(
          height: 40,
          width: 82,
        ),
        iconTheme: IconThemeData(
          color: context.appColor.whiteColor,
        ),
        actions: const [
          SizedBox(
            width: 24,
          ),
          UserImageWidget(
            userName:
                'Mohamed Abdelbaky', //TODO replace this with logged in user and path his image if it exist
          ),
        ],
      ),
  };
}
