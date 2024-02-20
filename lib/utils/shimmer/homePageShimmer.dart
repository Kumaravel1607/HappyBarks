// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:shimmer/shimmer.dart';

Widget bannerShimmer() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 0,
    ),
    child: Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        child: Image.asset(
          "assets/images/banner_home_1.png",
          width: SizeConfig.screenWidth,
          height: SizeConfig.fullHeight! * 0.42,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
  );
}

Widget categoriesShimmer() {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 60),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: TextWidget(
              text: AppStrings.homeText1,
              color: CommonColor.homeTextColor,
              maxLine: 1,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: TextWidget(
              text: AppStrings.homeText2,
              color: CommonColor.homeTextColor,
              maxLine: 1,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w700,
              fontSize: 16),
        ),
        const SizedBox(
          height: 12,
        ),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: 6,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 1,
                height: 130.0, //48 dp of height
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300]!),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextWidget(
                        text: AppStrings.buyPets,
                        color: CommonColor.greyAppBarTextColor,
                        maxLine: 1,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                  ],
                );
              }),
        ),
        const SizedBox(
          height: 28,
        ),
      ],
    ),
  );
}
