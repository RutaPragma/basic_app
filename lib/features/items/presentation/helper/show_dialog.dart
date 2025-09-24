import 'package:basic_app/features/items/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

///Este helper a futuro podra realizar el llamado de cualquier otro dialog

Future<void> showConfirmDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
  String confirmText = '',
  String cancelText = '',
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => ConfirmDialog(
      title: title,
      message: message,
      onConfirm: onConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
    ),
  );
}
