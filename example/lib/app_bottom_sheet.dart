import 'dart:ui';

import 'package:flutter/material.dart';

class AppBottomSheet {
  bool isShown = false;

  void showModal({
    required Widget content,
    BorderRadius? shapeBorder,
    VoidCallback? onClose,
    required bool isScrollControlled,
    bool? isDismissible,
    required BuildContext context,
  }) {
    if (!isShown) {
      showModalBottomSheet<void>(
        context: context!,
        isScrollControlled: isScrollControlled,
        backgroundColor: Colors.transparent,
        isDismissible: isDismissible ?? true,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 1),
            child: DecoratedBox(

              decoration: BoxDecoration(),
              child: content,
            ),
          );
        },
      ).then((value) {
        onClose?.call();
      });
      isShown = true;
    }
  }
}
