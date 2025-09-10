import 'package:common_flutter/src/enum/enum.dart';
import 'package:common_flutter/src/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:toastification/toastification.dart';

class CommonToastUtils {
  CommonToastUtils._();

  static void showMessage({
    TypeToast? type = TypeToast.success,
    required String msg,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      webPosition: "center",
      backgroundColor:
          type == TypeToast.success
              ? CommonUtils.hexToColor("#3FCB28")
              : CommonUtils.hexToColor("#F41E21"),
    );
  }

  static void showToastification({
    required ToastificationType type,
    Widget? title,
    Widget? icon,
    Duration? duration,
  }) {
    toastification.show(
      type: type,
      title: title,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      icon: icon,
      foregroundColor:
          type == ToastificationType.success ? Colors.green : Colors.red,
      alignment: Alignment.topCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 500),
      style: ToastificationStyle.flatColored,
    );
  }
}
