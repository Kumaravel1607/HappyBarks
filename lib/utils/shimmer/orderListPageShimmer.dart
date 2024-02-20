// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:shimmer/shimmer.dart';

Widget orderListShimmer() {
  return Container(
      color: CommonColor.whiteColor,
      child: Padding(
          padding: const EdgeInsets.only(
            left: 28,
            top: 30,
            right: 28,
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 8,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                width: SizeConfig.fullWidth,
                height: 90,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(4, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 38, right: 38, top: 12, bottom: 12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.white,
                                child: TextWidget(
                                    text: AppStrings.orderDate,
                                    color: CommonColor
                                        .greyBottomNavContentColorInactive,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.white,
                                child: TextWidget(
                                    text: '10 May 2023',
                                    color: CommonColor.textColorBalck1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.white,
                                child: TextWidget(
                                    text: AppStrings.orderNumber,
                                    color: CommonColor
                                        .greyBottomNavContentColorInactive,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.white,
                                child: TextWidget(
                                    text: "#xxxxxxx",
                                    color: CommonColor.textColorBalck1,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: ShapeDecoration(
                                color:
                                    CommonColor.blueBottomNavContentColorActive,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.white,
                                  child: TextWidget(
                                      text: AppStrings.orderDetailsCap,
                                      color: CommonColor.whiteColor,
                                      maxLine: 1,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.deliveryDate + " : ",
                                    style: TextStyle(
                                      color: CommonColor
                                          .greyBottomNavContentColorInactive,
                                      fontSize: 10,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '13 May 2023',
                                    style: TextStyle(
                                      color: CommonColor.textColorBalck1,
                                      fontSize: 10,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                            child: TextWidget(
                                text: AppStrings.orderPending,
                                color: CommonColor.textColorOrange1,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 15);
            },
          )));
}
