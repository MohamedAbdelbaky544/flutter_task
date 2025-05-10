import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/presentation/blocs/base_state.dart';
import 'package:flutter_task/core/presentation/extensions/date_format_extension.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:flutter_task/core/presentation/extensions/tr.dart';
import 'package:flutter_task/core/presentation/utils/generated/generated_assets/assets.gen.dart';
import 'package:flutter_task/core/presentation/utils/screen_utils.dart';
import 'package:flutter_task/core/presentation/widgets/error_view.dart';
import 'package:flutter_task/core/presentation/widgets/loader.dart';
import 'package:flutter_task/home/domain/entities/tourist.dart';
import 'package:flutter_task/home/domain/entities/trip.dart';
import 'package:flutter_task/home/presentation/cubits/get_trips_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_task/injection.dart';

class ItemsTabWidget extends StatefulWidget {
  const ItemsTabWidget({super.key});

  @override
  State<ItemsTabWidget> createState() => _ItemsTabWidgetState();
}

class _ItemsTabWidgetState extends State<ItemsTabWidget> {
  final GetTripsCubit cubit = getIt<GetTripsCubit>();
  @override
  void initState() {
    cubit.getTripsMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTripsCubit, BaseState<List<Trip>>>(
      bloc: cubit,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isInProgress) {
          return const Center(child: Loader());
        } else if (state.isFailure) {
          return ErrorView(
            onRetry: () {
              cubit.getTripsMethod();
            },
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          checkResponsive(context) == ResponsiveUI.mobile
                              ? 0
                              : 16),
                  child: Row(
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
                            child: Tooltip(
                              message: context.translation.filters,
                              child: GestureDetector(
                                onTap: () {
                                  //TODO add filter to retrive data
                                },
                                child: Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.appColor.containerColor,
                                  ),
                                  child: Center(
                                      child: Assets.icons.filtersIcon.svg()),
                                ),
                              ),
                            ),
                          ),
                          if (checkResponsive(context) == ResponsiveUI.web) ...[
                            SizedBox(
                              height: 48,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
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
                                      style: context.textTheme.titleMedium
                                          ?.copyWith(
                                        color: context.appColor.textColor.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Wrap(
                  runSpacing: 16,
                  spacing: 20,
                  children: [
                    if (state.item != null)
                      for (int i = 0; i < state.item!.length; i++)
                        Container(
                          width: checkResponsive(context) == ResponsiveUI.web
                              ? 244
                              : 343,
                          height: 322,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: context.appColor.lightBlack,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  color: context.appColor.primaryColor
                                      .withOpacity(0.1),
                                  offset: const Offset(0, 0)),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            children: [
                              Container(
                                color: context.primaryColor.withOpacity(0.6),
                                child: state.item?[i].image != null
                                    ? CachedNetworkImage(
                                        height: 182,
                                        width: checkResponsive(context) ==
                                                ResponsiveUI.web
                                            ? 244
                                            : 343,
                                        placeholder: (context, url) =>
                                            const Loader(),
                                        imageUrl: state.item![i].image!,
                                        fit: BoxFit.fill,
                                        errorWidget: (context, url, error) =>
                                            Assets.images.testImage.image(
                                          height: 182,
                                          width: checkResponsive(context) ==
                                                  ResponsiveUI.web
                                              ? 244
                                              : 343,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Assets.images.testImage.image(
                                        height: 182,
                                        width: checkResponsive(context) ==
                                                ResponsiveUI.web
                                            ? 244
                                            : 343,
                                        fit: BoxFit.cover,
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
                                        color: context.primaryColor
                                            .withOpacity(0.6),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child:
                                            Assets.icons.moreHorizontal.svg(),
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
                                    color:
                                        context.appColor.brown.withOpacity(0.1),
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
                                  width: checkResponsive(context) ==
                                          ResponsiveUI.web
                                      ? 244
                                      : 343,
                                  height: 142,
                                  color: context.appColor.lightBlack,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Tooltip(
                                          message: state.item![i].itemTitle,
                                          child: Text(
                                            state.item![i]
                                                .itemTitle, // TODO populte item title
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
                                                message:
                                                    '${state.item![i].nights} (${state.item![i].startDate.formatDateTo(dateTimePattern: DateTimePattern.ddMmmmYyyy)} - ${state.item![i].endDate.formatDateTo(dateTimePattern: DateTimePattern.ddMmmmYyyy)})',
                                                child: Text(
                                                  '${state.item![i].nights} (${state.item![i].startDate.formatDateTo(dateTimePattern: DateTimePattern.ddMmmmYyyy)} - ${state.item![i].endDate.formatDateTo(dateTimePattern: DateTimePattern.ddMmmmYyyy)})',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: Divider(
                                            color:
                                                context.appColor.dividerColor,
                                          ),
                                        ),
                                        UsersImages(
                                          unfinishedTasks:
                                              state.item![i].unfinishedTasks,
                                          width: checkResponsive(context) ==
                                                  ResponsiveUI.web
                                              ? 244
                                              : 343,
                                          tourists: state.item![i].tourists,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    else
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 1.5,
                        child: Center(
                          child: Text(
                            context.translation.thereIsNoData,
                            style: context.textTheme.headlineLarge,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        }
      },
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
      mainAxisAlignment: tourists != null
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: [
        if (tourists != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tourists!.length > 4) ...[
                for (int i = 0; i < 4; i++)
                  Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: context.appColor.containerColor,
                      child: tourists![i].image != null
                          ? Container(
                              height: 24,
                              width: 24,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const Loader(),
                                imageUrl: tourists![i].image!,
                                fit: BoxFit.fill,
                                height: 24,
                                width: 24,
                                errorWidget: (context, url, error) =>
                                    Assets.images.userImage.image(
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : Assets.images.userImage.image(),
                    ),
                  ),
                Align(
                  widthFactor: 0.5,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: context.appColor.containerColor,
                    child: Center(
                      child: Text(
                        '+${tourists!.length.toString()}',
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                  ),
                )
              ] else
                for (int i = 0; i < tourists!.length; i++)
                  Align(
                    widthFactor: 0.5,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: context.appColor.grey,
                      child: tourists![i].image != null
                          ? Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              clipBehavior: Clip.antiAlias,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => const Loader(),
                                imageUrl: tourists![i].image!,
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) =>
                                    Assets.images.userImage.image(
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : Assets.images.userImage.image(),
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
