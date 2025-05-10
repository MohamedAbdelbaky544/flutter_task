import 'package:flutter_task/core/domain/entities/enum/server_error_code.dart';
import 'package:flutter_task/core/domain/entities/failure.dart';
import 'package:flutter_task/core/presentation/extensions/tr.dart';
import 'package:flutter_task/core/presentation/themes/app_theme.dart';
import 'package:flutter_task/core/presentation/utils/generated/translation/translations.dart';
import 'package:flutter/material.dart';

mixin ScreenUtils<T extends StatefulWidget> on State<T> {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? handleError(
      {Failure? failure,
      String? customMessage,
      Map<ServerErrorCode, String>? customMessages,
      bool isFloating = false}) {
    return showError(
        failure: failure,
        customMessage: customMessage,
        customMessages: customMessages,
        isFloating: isFloating);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
      {Failure? failure,
      String? customMessage,
      Map<ServerErrorCode, String>? customMessages,
      bool isFloating = false}) {
    final tr = Translations.of(context)!;
    String message = customMessage ?? tr.errorMessage;
    if (failure != null) {
      if (failure is ServerFailure) {
        if (failure.errorCode == ServerErrorCode.forbidden ||
            failure.errorCode == ServerErrorCode.accessDenied) {
          message = tr.accessDeniedMessage;
        } else if ((customMessages?.isNotEmpty ?? false) &&
            customMessages?[failure.errorCode] != null) {
          message = customMessages![failure.errorCode] ?? tr.errorMessage;
        } else if (failure.message.isNotEmpty) {
          message = failure.message;
        }
      } else if (failure is NetworkFailure) {
        message = (failure.connectionTimeOut)
            ? context.translation.connectionTimeOut
            : context.translation.noInternetConnection;
      }
    }

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline,
              color: Theme.of(context).appColors.whiteColor),
          const SizedBox(width: 4),
          Expanded(
              child: Text(
            message,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).appColors.whiteColor),
          )),
        ],
      ),
      backgroundColor: Theme.of(context).appColors.errorColor,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
      {String? customMessage, Color? customColor, bool isFloating = false}) {
    final tr = Translations.of(context)!;
    String message = customMessage ?? tr.success;

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: customColor ?? Theme.of(context).appColors.successColor,
      behavior: isFloating ? SnackBarBehavior.floating : null,
    ));
  }
}
