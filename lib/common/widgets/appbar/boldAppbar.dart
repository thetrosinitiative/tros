import 'package:flutter/material.dart';
import 'package:tros/utils/constants/colors.dart';
import 'package:tros/utils/device/device_utility.dart';

class BoldAppbar extends StatelessWidget implements PreferredSizeWidget {
  const BoldAppbar({
    super.key,
    this.implyLeading = false,
    this.onPressed,
    required this.text,
    this.iconData = Icons.gpp_maybe_outlined,
    this.useScaffoldBgColor = false,
  });

  final bool implyLeading;
  final Function()? onPressed;
  final String text;
  final IconData? iconData;
  final bool useScaffoldBgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: implyLeading,
      backgroundColor: useScaffoldBgColor ? null : PColors.white,
      title: Text(
        text,
        style: Theme.of(context).textTheme.displaySmall!.apply(
            color: PColors.primary,
            fontWeightDelta: 3,
            fontSizeDelta: -2,
            letterSpacingDelta: 2),
      ),
      actions: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              size: 28,
              color: PColors.primary,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
