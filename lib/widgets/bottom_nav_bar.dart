
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:happy_bark/screens/account/my_account_screen.dart';
import 'package:happy_bark/screens/health/pet_management_system_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:happy_bark/main.dart';
import 'package:happy_bark/screens/about_us/about_us_screen.dart';
import 'package:happy_bark/screens/cart/cart_screen.dart';
import 'package:happy_bark/screens/health/health_screen.dart';
import 'package:happy_bark/screens/home/home_screen.dart';
import 'package:happy_bark/screens/services_pages/services_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/widgets/dialogs/exit_popup_dialog.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  PersistentTabController? _controller;
  bool hideNavigationBar = false;
  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const ServicesPage(),
            PetManagementSystemScreen(),
      const CartPage(
        fromBottomNav: true,
      ),
      const MyAccountScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "assets/images/home_icon.png",
              width: 15,
              height: 15,
              color: CommonColor.blueBottomNavContentColorActive,
            ),
            const Text(
              "Home",
              style: TextStyle(
                  color: CommonColor.blueBottomNavContentColorActive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "assets/images/home_icon.png",
              width: 15,
              height: 15,
              color: CommonColor.greyBottomNavContentColorInactive,
            ),
            const Text(
              "Home",
              style: TextStyle(
                  color: CommonColor.greyBottomNavContentColorInactive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        activeColorPrimary: CommonColor.blueBottomNavContentColorActive,
        inactiveColorPrimary: CommonColor.greyBottomNavContentColorInactive,
      ),
      PersistentBottomNavBarItem(
        // onSelectedTabPressWhenNoScreensPushed: () {
        //   log("onSelectedTabPressWhenNoScreensPushed : ");
        //   PersistentNavBarNavigator.pushNewScreen(
        //     context,
        //     screen: ServicesPage(),
        //     withNavBar: true, // OPTIONAL VALUE. True by default.
        //     pageTransitionAnimation: PageTransitionAnimation.cupertino,
        //   );
        // },
        icon: Column(
          children: [
            Image.asset(
              "assets/images/categories.png",
              width: 15,
              height: 15,
              color: CommonColor.blueBottomNavContentColorActive,
            ),
            const Text(
              "Services",
              style: TextStyle(
                  color: CommonColor.blueBottomNavContentColorActive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "assets/images/categories.png",
              width: 15,
              height: 15,
              color: CommonColor.greyBottomNavContentColorInactive,
            ),
            const Text(
              "Services",
              style: TextStyle(
                  color: CommonColor.greyBottomNavContentColorInactive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        activeColorPrimary: CommonColor.blueBottomNavContentColorActive,
        inactiveColorPrimary: CommonColor.greyBottomNavContentColorInactive,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "assets/images/pet_health.png",
              width: 15,
              height: 15,
              color: CommonColor.blueBottomNavContentColorActive,
            ),
            const Text(
              "Health",
              style: TextStyle(
                  color: CommonColor.blueBottomNavContentColorActive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "assets/images/pet_health.png",
              width: 15,
              height: 15,
              color: CommonColor.greyBottomNavContentColorInactive,
            ),
            const Text(
              "Health",
              style: TextStyle(
                  color: CommonColor.greyBottomNavContentColorInactive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        activeColorPrimary: CommonColor.blueBottomNavContentColorActive,
        inactiveColorPrimary: CommonColor.greyBottomNavContentColorInactive,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "assets/images/cart.png",
              width: 15,
              height: 15,
              color: CommonColor.blueBottomNavContentColorActive,
            ),
            const Text(
              "Cart",
              style: TextStyle(
                  color: CommonColor.blueBottomNavContentColorActive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "assets/images/cart.png",
              width: 15,
              height: 15,
              color: CommonColor.greyBottomNavContentColorInactive,
            ),
            const Text(
              "Cart",
              style: TextStyle(
                  color: CommonColor.greyBottomNavContentColorInactive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        activeColorPrimary: CommonColor.blueBottomNavContentColorActive,
        inactiveColorPrimary: CommonColor.greyBottomNavContentColorInactive,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(
              "assets/images/info.png",
              width: 15,
              height: 15,
              color: CommonColor.blueBottomNavContentColorActive,
            ),
            const Text(
              "Account",
              style: TextStyle(
                  color: CommonColor.blueBottomNavContentColorActive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        inactiveIcon: Column(
          children: [
            Image.asset(
              "assets/images/info.png",
              width: 15,
              height: 15,
              color: CommonColor.greyBottomNavContentColorInactive,
            ),
            const Text(
              "Account",
              style: TextStyle(
                  color: CommonColor.greyBottomNavContentColorInactive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 10),
            )
          ],
        ),
        activeColorPrimary: CommonColor.blueBottomNavContentColorActive,
        inactiveColorPrimary: CommonColor.greyBottomNavContentColorInactive,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //bool value;
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white.withOpacity(0.7),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          navBarHeight: 52,
          hideNavigationBarWhenKeyboardShows: true,
          margin: const EdgeInsets.all(0.0),
          popActionScreens: PopActionScreensType.all,
          bottomScreenMargin: 0.0,
          // onWillPop: (context) async {
          //   // value =
          //   //showExitPopup(context!, SizeConfig.fullWidth!);
          //   return true;
          // },
          selectedTabScreenContext: (final context) {
            // testContext = context;
            if (_controller!.index == 3) {
              Future.delayed(const Duration(milliseconds: 100), () {
                setState(() {
                  hideNavigationBar = true;
                });
              });
            } else {
              Future.delayed(const Duration(milliseconds: 100), () {
                setState(() {
                  hideNavigationBar = false;
                });
              });
            }
          },
          hideNavigationBar: hideNavigationBar,
          decoration: const NavBarDecoration(
            colorBehindNavBar: Colors.indigo,
          ),
          popAllScreensOnTapOfSelectedTab: false,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.simple,
        ),
      ),
    );
  }
}
