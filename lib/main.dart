import 'package:flutter/material.dart';
import 'package:flutter_task/core/presentation/themes/app_theme.dart';
import 'package:flutter_task/core/presentation/utils/generated/translation/translations.dart';
import 'package:flutter_task/core/presentation/utils/routing/route_info.dart';
import 'package:flutter_task/core/presentation/utils/routing/router.dart';
import 'package:flutter_task/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: Translations.localizationsDelegates,
      supportedLocales: Translations.supportedLocales,
      themeMode: ThemeMode.dark,
      theme: Theme.of(context).appTheme(Brightness.dark).getThemeData(context),
      routerConfig: _goRouterConfig,
      builder: (context, widget) {
        return MediaQuery.withClampedTextScaling(
          minScaleFactor: 0.8,
          maxScaleFactor: 1.2,
          child: Builder(
            builder: (context) {
              if (widget == null) {
                return const SizedBox();
              }
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: SafeArea(
                  top: false,
                  left: false,
                  right: false,
                  child: widget,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _goRouterConfig = GoRouter(
  initialLocation: HomePage.path,
  navigatorKey: _rootNavigatorKey,
  routes: _getRoutes(Routes.I.route),
);

List<RouteBase> _getRoutes(List<RouteInfo>? routes) => (routes ?? [])
    .map(
      (subRoute) => GoRoute(
        path: subRoute.path,
        name: subRoute.name ?? subRoute.path,
        builder: (context, state) => subRoute.builder(context, state),
        routes: _getRoutes(subRoute.routes),
      ),
    )
    .toList();
