import 'package:flutter/material.dart';

class CommonHeaderModal extends StatelessWidget {
  const CommonHeaderModal({super.key, required this.title, this.titleStyle});
  final String title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 20),
          Text(title, style: titleStyle),
          // IconButton(
          //   icon: SvgPicture.asset(
          //     Assets.icons.icX,
          //     colorFilter: ColorFilter.mode(
          //       context.colors.black,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}
