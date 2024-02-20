import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/screens/home/home_screen.dart';
import 'package:happy_bark/screens/login/login_screen.dart';
import 'package:happy_bark/screens/order/order_list_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Container(
            width: 197,
            alignment: Alignment.centerLeft,
            child: const Text(
              AppStrings.myAccount,
              style: TextStyle(
                  color: CommonColor.greyBottomNavContentColorInactive,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
          ),
        ),
        isback: false,
        actions: const [
          // Icon(
          //   Icons.search,
          //   // size: 20,
          //   color: CommonColor.greyBottomNavContentColorInactive,
          // ),
          // SizedBox(
          //   width: 13,
          // ),
          //   Icon(
          //     Icons.home_outlined,
          //     //  size: 20,
          //     color: CommonColor.greyBottomNavContentColorInactive,
          //   ),
          //   SizedBox(
          //     width: 13,
          //   ),
          //   Icon(
          //     Icons.badge,
          //     //  size: 20,
          //     color: CommonColor.greyBottomNavContentColorInactive,
          //   ),
          //   SizedBox(
          //     width: 16,
          //   )
        ],
        //   controller: _searchTextController,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUploadProfileOrEditContainer(),
            SizedBox(
              height: 43,
            ),
            _buildOtherDetails(context, "Order"),
            SizedBox(
              height: 20,
            ),
            _buildOtherDetails(context, "Your Pet"),
            SizedBox(
              height: 20,
            ),
            _buildOtherDetails(context, "My Addresses"),
            SizedBox(
              height: 20,
            ),
            _buildOtherDetails(context, "Contact Us"),
            SizedBox(
              height: 20,
            ),
            _buildOtherDetails(context, "About"),
            SizedBox(
              height: 80,
            ),
            _buildLogOutButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildUploadProfileOrEditContainer() {
    return Container(
      height: 106,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: EdgeInsets.only(left: 33, right: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: CommonColor.blueBottomNavContentColorActive,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, Sk Bhoi",
                    style: TextStyle(
                        height: 1.8,
                        color: Colors.white,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  Text(
                    "tbd3210@gmail.com\n9883960290",
                    style: TextStyle(
                        height: 2,
                        color: Colors.white,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ],
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Edit",
                  style: TextStyle(
                      color: CommonColor.blueBottomNavContentColorActive,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildOtherDetails(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        readOnly: true,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(
                color: CommonColor.greyBottomNavContentColorInactive,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 14),
            suffixIcon: InkWell(child: Icon(Icons.arrow_forward_ios_sharp))),
        onTap: () async {
          final prefs = await Util.sharedPrefs;

          if (prefs.getString(Constant.authToken) != null &&
              prefs.getString(Constant.authToken)!.isNotEmpty) {
            if (title == "Order") {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: OrderListPage(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildLogOutButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              final prefs = await Util.sharedPrefs;
              prefs.clear();
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: LoginPage(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     CupertinoPageRoute(builder: (context) => LoginPage()),
              //     (route) => false);
            },
            child: Container(
              height: 57,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CommonColor.blueBottomNavContentColorActive),
              child: Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
