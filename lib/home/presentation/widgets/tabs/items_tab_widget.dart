import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:flutter_task/core/presentation/extensions/tr.dart';
import 'package:flutter_task/core/presentation/utils/generated/generated_assets/assets.gen.dart';
import 'package:flutter_task/home/domain/entities/tourist.dart';

class ItemsTabWidget extends StatefulWidget {
  const ItemsTabWidget({super.key});

  @override
  State<ItemsTabWidget> createState() => _ItemsTabWidgetState();
}

class _ItemsTabWidgetState extends State<ItemsTabWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.translation.items,
                  style: context.textTheme.headlineLarge,
                ),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.appColor.containerColor,
                        ),
                        child: Center(child: Assets.icons.filtersIcon.svg()),
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: VerticalDivider(
                          color: context.appColor.dividerColor,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Assets.icons.plusIcon.svg(),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              context.translation.addANewItem,
                              style: context.textTheme.titleMedium?.copyWith(
                                color: context.appColor.textColor.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Wrap(
              runSpacing: 16,
              spacing: 20,
              children: [
                for (int i = 0; i < 7; i++)
                  Container(
                    width: 244,
                    height: 322,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: context.appColor.lightBlack,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 0,
                            color:
                                context.appColor.primaryColor.withOpacity(0.1),
                            offset: const Offset(0, 0)),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Container(
                          color: context.primaryColor.withOpacity(0.6),
                          child: Assets.images.testImage.image(
                            height: 182,
                            width: 244,
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                //TODO show more options
                              },
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: context.primaryColor.withOpacity(0.6),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Assets.icons.moreHorizontal.svg(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 140,
                          left: 15,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: context.appColor.brown,
                              ),
                              color: context.appColor.brown.withOpacity(0.1),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Pending Approval',
                                  style: context.textTheme.titleMedium,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: context.appColor.whiteColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 180,
                          child: Container(
                            width: 244,
                            height: 142,
                            color: context.appColor.lightBlack,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Tooltip(
                                    message: 'item Title',
                                    child: Text(
                                      'item Title', // TODO populte item title
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textTheme.titleLarge,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Assets.icons.calendar.svg(),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Flexible(
                                        child: Tooltip(
                                          message: 'Jan 16 - Jan 20, 2024',
                                          child: Text(
                                            'Jan 16 - Jan 20, 2024',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: context.textTheme.bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: Divider(
                                      color: context.appColor.dividerColor,
                                    ),
                                  ),
                                  const UsersImages(
                                    unfinishedTasks: 1,
                                    width: 244,
                                    tourists: [],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UsersImages extends StatelessWidget {
  const UsersImages({
    super.key,
    this.tourists,
    required this.unfinishedTasks,
    required this.width,
  });
  final List<Tourist>? tourists;
  final int unfinishedTasks;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // if (tourists != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < tourists!.length; i++)
              Align(
                widthFactor: 0.5,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: context.appColor.grey,
                  child: Assets.images.userImage.image(),
                  // backgroundImage: NetworkImage(tourists[i].image),
                ),
              )
          ],
        ),
        Flexible(
          child: Tooltip(
            message: '$unfinishedTasks ${context.translation.unfinishedTasks}',
            child: Text(
              '$unfinishedTasks ${context.translation.unfinishedTasks}',
              style: context.textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
