import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/search_text_form_field.dart';

class CustomAppBarWithActions extends StatelessWidget with PreferredSizeWidget {
  CustomAppBarWithActions(
      {this.title,
      this.centerTitle,
      this.actions,
      this.controller,
      this.onChanged});

  Widget? title;

  bool? centerTitle;

  List<Widget>? actions;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 50,
      automaticallyImplyLeading: false,
      backgroundColor: CommonColor.appBarColor,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: CommonColor.greyBottomNavContentColorInactive,
          )),
    );
  }

  @override
  Size get preferredSize => Size(
        SizeConfig().width,
        60,
      );
}
