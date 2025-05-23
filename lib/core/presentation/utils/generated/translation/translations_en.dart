import 'package:intl/intl.dart' as intl;

import 'translations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([String locale = 'en']) : super(locale);

  @override
  String get items => 'Items';

  @override
  String get pricing => 'Pricing';

  @override
  String get info => 'Info';

  @override
  String get tasks => 'Tasks';

  @override
  String get analytics => 'Analytics';

  @override
  String get addANewItem => 'Add a New Item';

  @override
  String get pendingApproval => 'Pending Approval';

  @override
  String get unfinishedTasks => 'unfinished tasks';

  @override
  String tabItems(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'items': 'Items',
        'pricing': 'Pricing',
        'info': 'Info',
        'mosques': 'Mosques',
        'tasks': 'Tasks',
        'analytics': 'Analytics',
        'other': 'None',
      },
    );
    return '$_temp0';
  }

  @override
  String get home => 'Home Page';

  @override
  String get notification => 'Notification';

  @override
  String get settings => 'Settings';

  @override
  String get filters => 'Filters';

  @override
  String get success => 'success';

  @override
  String get errorMessage => 'OOPS! Something went wrong';

  @override
  String get accessDeniedMessage => 'Access Denied, You have insufficient privileges';

  @override
  String get connectionTimeOut => 'Connection Time Out!';

  @override
  String get retry => 'Retry';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get thereIsNoData => 'There Is No Data';
}
