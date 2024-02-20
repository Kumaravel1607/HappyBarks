import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/bottom_nav_bar.dart';
import 'package:happy_bark/widgets/search_text_form_field.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.title,
      required this.isback,
      this.fromBottomNav = false,
      this.centerTitle,
      this.actions,
      this.controller,
      this.onChanged})
      : super(key: key);

  final Widget? title;

  final bool? centerTitle;
  final bool isback;
  final bool fromBottomNav;
  final List<Widget>? actions;
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
        leading: !isback
            ? null
            : GestureDetector(
                onTap: () {
                  if (fromBottomNav) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const BottomNavBar()),
                        (route) => true);
                  } else {
                    Navigator.pop(context);
                  }

                  // PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  //   context,
                  //   screen: BottomNavBar(),
                  //   settings: RouteSettings(),
                  //   withNavBar: true, // OPTIONAL VALUE. True by default.
                  //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  // );
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: CommonColor.greyBottomNavContentColorInactive,
                )),
        bottom: actions != null
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  alignment: Alignment.center,
                  child: SearchTextFormFieldWidget(
                    controller: controller!,
                    hintText: AppStrings.searchAppBarHintText,
                    readOnly: false,
                    maxLine: 1,
                    keyType: TextInputType.text,
                    wordLimit: 50,
                    onChanged: (value) {
                      onChanged!(value);
                    },
                  ),
                ),
              ));
  }

  @override
  Size get preferredSize => Size(
        SizeConfig().width,
        actions != null ? 60 : 100,
      );
}
