import 'package:common_flutter/common_flutter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommonCustomDialog extends StatelessWidget {
  const CommonCustomDialog({
    super.key,
    this.title,
    this.titleStyle,
    required this.content,
    this.positiveButtonText,
    this.onPositiveButtonTap,
    this.positiveButtonTextStyle,
    this.negativeButtonText,
    this.onNegativeButtonTap,
    this.negativeButtonTextStyle,
    this.negativeBackgroundColor,
    this.negativeTextColor,
    this.positiveBackgroundColor,
    this.positiveTextColor,
    this.action,
  });

  final String? title;
  final TextStyle? titleStyle;
  final Widget? content;
  final Widget? action;

  final String? positiveButtonText;
  final VoidCallback? onPositiveButtonTap;
  final TextStyle? positiveButtonTextStyle;

  final String? negativeButtonText;
  final VoidCallback? onNegativeButtonTap;
  final TextStyle? negativeButtonTextStyle;

  final Color? negativeBackgroundColor;
  final Color? negativeTextColor;

  final Color? positiveBackgroundColor;
  final Color? positiveTextColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: titleStyle,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                if (title == null) const Gap(8),
                if (content != null) content!,
              ],
            ),
          ),
          action ??
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (onNegativeButtonTap != null) ...[
                      Expanded(
                        child: CommonPrimaryButton(
                          onPressed: onNegativeButtonTap,
                          border: BorderSide(
                            color: negativeBackgroundColor ?? Colors.black,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          backgroundColor: negativeBackgroundColor,
                          borderRadius: 30,
                          label: negativeButtonText ?? 'Xoá',
                          textColor: negativeTextColor,
                        ),
                      ),
                      SizedBox(width: 12),
                    ],
                    Expanded(
                      child: CommonPrimaryButton(
                        onPressed: onPositiveButtonTap,
                        border: BorderSide(color: Colors.black),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: positiveBackgroundColor,
                        borderRadius: 30,
                        label: positiveButtonText ?? 'Đồng ý',
                        textColor: positiveTextColor,
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
