import 'package:flutter_task/core/domain/entities/enum/server_error_code.dart';
import 'package:flutter_task/core/domain/entities/failure.dart';
import 'package:flutter_task/core/presentation/extensions/theme.dart';
import 'package:flutter_task/core/presentation/extensions/tr.dart';

import 'package:flutter/material.dart';

class ErrorView extends StatefulWidget {
  final String? message;
  final Function? onRetry;
  final Failure? failure;
  final Map<ServerErrorCode, String>? customMessages;

  const ErrorView({
    super.key,
    this.message,
    this.onRetry,
    this.failure,
    this.customMessages,
  });

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            _getErrorMessage,
            style: context.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        if (widget.onRetry != null) ...[
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            onPressed: () => widget.onRetry!(),
            child: Text(context.translation.retry),
          ),
        ]
      ],
    );
  }

  String get _getErrorMessage {
    String errorMessage = context.translation.errorMessage;

    if (widget.failure != null) {
      if (widget.failure is ServerFailure) {
        if ((widget.failure as ServerFailure).message.isNotEmpty) {
          errorMessage = (widget.failure as ServerFailure).message;
        } else {
          if ((widget.failure as ServerFailure).errorCode ==
              ServerErrorCode.forbidden) {
            errorMessage = context.translation.accessDeniedMessage;
          } else if (widget.customMessages != null &&
              widget.customMessages!.isNotEmpty &&
              widget.customMessages![
                      (widget.failure as ServerFailure).errorCode] !=
                  null) {
            errorMessage = widget.customMessages![
                (widget.failure as ServerFailure?)!.errorCode]!;
          }
        }
      } else if (widget.failure is NetworkFailure) {
        errorMessage = (widget.failure as NetworkFailure).connectionTimeOut
            ? context.translation.connectionTimeOut
            : context.translation.noInternetConnection;
      }
    } else if (widget.message != null) {
      errorMessage = widget.message!;
    }
    return errorMessage;
  }
}
