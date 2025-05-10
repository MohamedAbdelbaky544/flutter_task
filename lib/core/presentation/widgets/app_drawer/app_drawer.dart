import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:flutter_task/core/presentation/extensions/tr.dart';
import 'package:flutter_task/core/presentation/widgets/app_drawer/drawer_item.dart';
import 'package:flutter_task/home/presentation/pages/home_page.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.primaryColor,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            DrawerItem(
              path: HomePage.path,
              title: context.translation.home,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
