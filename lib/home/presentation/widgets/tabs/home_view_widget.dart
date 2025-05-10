import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/utils/screen_utils.dart';
import 'package:flutter_task/home/presentation/widgets/tabs/items_tab_widget.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<HomeViewWidget> createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  @override
  Widget build(BuildContext context) {
    return switch (checkResponsive(context)) {
      ResponsiveUI.mobile => const ItemsTabWidget(),
      _ => TabBarView(
          controller: widget.tabController,
          children: [
            const ItemsTabWidget(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
    };
  }
}
