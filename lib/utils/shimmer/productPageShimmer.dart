// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:shimmer/shimmer.dart';

Widget productsShimmer() {
  return Container(
    color: CommonColor.whiteColor,
    child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(4),
        itemCount: 10,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          height: 260.0, //48 dp of height
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: CommonColor.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.grey,
                        //       blurRadius: 3.0,
                        //       spreadRadius: 0.3,
                        //       offset: Offset(
                        //         5.0, // Move to right 7.0 horizontally
                        //         5.0, // Move to bottom 8.0 Vertically
                        //       ))
                        // ],
                      ),
                      child: Image.asset(
                        'assets/images/product_img1.png',
                        fit: BoxFit.fill,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: const TextWidget(
                        text: AppStrings.productContent,
                        color: CommonColor.greyAppBarTextColor,
                        maxLine: 3,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w700,
                        fontSize: 10),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: const TextWidget(
                        text: AppStrings.productName,
                        color: CommonColor.greyAppBarTextColor,
                        maxLine: 3,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: const TextWidget(
                        text: AppStrings.productPrice,
                        color: CommonColor.greyAppBarTextColor,
                        maxLine: 3,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w600,
                        fontSize: 10),
                  )
                ],
              ),
            ),
          );
        }),
  );
}
