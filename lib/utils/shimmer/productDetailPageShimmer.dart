// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:shimmer/shimmer.dart';

Widget productDetailShimmer() {
  return Container(
      color: CommonColor.whiteColor,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 17, right: 20, bottom: 70),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: Container(
              width: SizeConfig.fullWidth,
              height: 280,
              decoration: const BoxDecoration(
                color: CommonColor.whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  "assets/images/product_img1.png",
                  fit: BoxFit.fill,
                  //width: 137,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            width: double.infinity,
            height: 75,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, indeex) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        "assets/images/product_img1.png",
                        fit: BoxFit.fill,
                        width: 74,
                        height: 74,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, ind) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemCount: 5),
          ),
          const SizedBox(
            height: 8,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: TextWidget(
                text: AppStrings.productContent,
                color: CommonColor.greyAppBarTextColor,
                maxLine: 3,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w700,
                fontSize: 12),
          ),
          const SizedBox(
            height: 4,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: const TextWidget(
                text: AppStrings.productName,
                color: CommonColor.greyAppBarTextColor,
                maxLine: 3,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 12),
          ),
          const SizedBox(
            height: 9,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: RatingBar.builder(
              initialRating: 3,
              itemSize: 20,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            child: const TextWidget(
                text: AppStrings.size,
                color: CommonColor.greyAppBarTextColor,
                maxLine: 3,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
        ]),
      ));
}
