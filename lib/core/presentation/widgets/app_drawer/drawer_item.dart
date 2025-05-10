import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:go_router/go_router.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({
    super.key,
    required this.path,
    required this.title,
  });
  final String title;
  final String path;

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTab(widget.path),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: widget.path == ModalRoute.of(context)!.settings.name
              ? context.appColor.textColor.yellow
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Text(
              widget.title,
              style: context.textTheme.titleMedium?.copyWith(
                color: widget.path == ModalRoute.of(context)!.settings.name
                    ? context.appColor.textColor.white
                    : context.appColor.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTab(String path) {
    if (path == ModalRoute.of(context)!.settings.name) {
      context.pop();
      return;
    }
    while (context.canPop()) {
      context.pop();
    }
    if (path != ModalRoute.of(context)!.settings.name) {
      context.pushNamed(path);
      return;
    }
  }
}
