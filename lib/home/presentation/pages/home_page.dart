import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:flutter_task/core/presentation/extensions/tr.dart';
import 'package:flutter_task/core/presentation/utils/generated/generated_assets/assets.gen.dart';
import 'package:flutter_task/home/domain/entities/enum/tab_items_eunm.dart';
import 'package:flutter_task/home/presentation/widgets/tabs/items_tab_widget.dart';
import 'package:flutter_task/home/presentation/widgets/user_image_widget.dart';

class HomePage extends StatefulWidget {
  static const path = '/Home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            tabAlignment: TabAlignment.center,
            isScrollable: true,
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
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const ItemsTabWidget(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
