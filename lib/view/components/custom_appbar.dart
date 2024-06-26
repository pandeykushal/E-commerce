import 'package:flutter/material.dart';

import '../../view_model/utils/export_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackTap;
  final Color? backgroundColor;
  final Widget? leading;
  final TextStyle? style;
  final List<Widget>? actions;
 final  double? leadingWidth;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.backgroundColor,
    this.leading,
    this.style,
    this.actions, this.leadingWidth,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidth ,
      leading: leading ?? const SizedBox.shrink(),
      title: Text(
        title,
        style: style ??
            Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600, color: AppColor.black),
      ),
      actions: actions ?? [],
    );
  }
}
