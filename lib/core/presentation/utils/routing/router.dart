import 'package:flutter_task/core/presentation/utils/routing/route_info.dart';
import 'package:flutter_task/home/presentation/pages/home_page.dart';

class Routes {
  Routes._();
  static Routes I = Routes._();

  final List<RouteInfo> route = [
    RouteInfo(
      path: HomePage.path,
      builder: (context, state) => const HomePage(),
    ),
  ];
}
