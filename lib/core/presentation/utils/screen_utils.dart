import 'package:flutter/material.dart';

ResponsiveUI checkResponsive(
  BuildContext context,
) {
  if (MediaQuery.sizeOf(context).width > 820) {
    return ResponsiveUI.web;
  } else if (MediaQuery.sizeOf(context).width > 480 &&
      MediaQuery.sizeOf(context).width < 820) {
    return ResponsiveUI.table;
  } else {
    return ResponsiveUI.mobile;
  }
}

enum ResponsiveUI {
  mobile,
  table,
  web,
}
