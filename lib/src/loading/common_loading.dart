import 'package:common_flutter/src/utils/platform_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({
    super.key,
    required this.isLoading,
    this.color = Colors.black,
    this.child,
  });

  final bool isLoading;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          CommonPlatformUtils.isIOSDevice && !isLoading
              ? null
              : (didPop) => Future.value(!isLoading);
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: Colors.black12,
          child: Center(child: child ?? SpinKitCircle(color: color)),
        ),
      ),
    );
  }
}
