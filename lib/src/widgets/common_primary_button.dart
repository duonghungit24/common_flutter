import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CommonPrimaryButton extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final double borderRadius;
  final EdgeInsets padding;
  final double elevation;
  final Color? textColor;
  final BorderSide? border;
  final Color? shadowColor;
  final Size? fixedSize;
  final Gradient? gradient;
  final bool isDisabled;
  final Widget? leftWidget;
  final Widget? righWidget;
  final Size? minimumSize;

  const CommonPrimaryButton({
    super.key,
    required this.label,
    this.righWidget,
    this.leftWidget,
    this.onPressed,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(10),
    this.elevation = 0.0,
    this.textColor,
    this.border,
    this.shadowColor,
    this.fixedSize,
    this.gradient,
    this.isDisabled = false,
    this.textStyle,
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.grey[400],
        padding: padding,
        elevation: elevation,
        backgroundColor: backgroundColor ?? Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: border ?? BorderSide.none,
        ),
        shadowColor: shadowColor,
        fixedSize: fixedSize,
        foregroundColor: textColor ?? Colors.white,
        disabledForegroundColor: Colors.white,
        minimumSize: (kIsWeb ? Size(120, 44) : minimumSize ?? Size(70, 28)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leftWidget != null) ...[leftWidget!, SizedBox(width: 6)],
            Expanded(
              flex: 0,
              child: Center(child: Text(label, style: textStyle)),
            ),
            if (righWidget != null) ...[SizedBox(width: 6), righWidget!],
          ],
        ),
      ),
    );
  }
}
