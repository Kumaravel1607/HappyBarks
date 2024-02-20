// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:shimmer/shimmer.dart';

Widget brandsShimmer() {
  return Container(
    color: CommonColor.whiteColor,
    child: Padding(
        padding:
            const EdgeInsets.only(left: 16, top: 22, right: 16, bottom: 70),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 1,
              height: 130.0, //48 dp of height
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: CommonColor.grayHomeGridViewBg,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Image.asset(
                          "assets/images/acana_logo.png",
                          // fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: TextWidget(
                          text: '',
                          color: CommonColor.greyAppBarTextColor,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                  ],
                ),
              );
            })),
  );
}
