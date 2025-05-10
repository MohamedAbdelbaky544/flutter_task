import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:flutter_task/core/presentation/extensions/tr.dart';
import 'package:flutter_task/core/presentation/utils/generated/generated_assets/assets.gen.dart';
import 'package:flutter_task/core/presentation/utils/screen_utils.dart';
import 'package:flutter_task/core/presentation/widgets/app_drawer/app_drawer.dart';
import 'package:flutter_task/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter_task/home/presentation/widgets/tabs/home_view_widget.dart';

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
      appBar: customAppBar(
        tabController: tabController,
        context: context,
      ),
      drawer: checkResponsive(context) == ResponsiveUI.web ||
              checkResponsive(context) == ResponsiveUI.table
          ? null
          : const AppDrawer(),
      floatingActionButton: checkResponsive(context) == ResponsiveUI.web
          ? null
          : Tooltip(
              message: context.translation.addANewItem,
              child: FloatingActionButton(
                backgroundColor: context.appColor.secondaryColor,
                onPressed: () {},
                child: Assets.icons.plusIcon.svg(),
              ),
            ),
      body: HomeViewWidget(
        tabController: tabController,
      ),
    );
  }
}
