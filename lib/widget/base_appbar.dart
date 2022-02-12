import 'package:flutter/material.dart';
import 'package:vorkinsta/screens/auth/login_page.dart';
import 'package:vorkinsta/values/app_colors.dart';
import 'package:vorkinsta/values/app_strings.dart';

class BaseAppbar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final List<Widget>? widgets;
  final IconData? iconData;

  BaseAppbar({required this.appBar, this.widgets, this.iconData});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: iconData != null ? Icon(iconData) : null,
      titleSpacing: 0,
      title: SizedBox(
          height: 30,
          width: 100,
          child: Image.asset('assets/oneIcon.png', fit: BoxFit.contain)),
      actions: widgets,
      elevation: 0,
      backgroundColor: AppColors.blue,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
