// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:happy_bark/screens/cart/cart_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:shimmer/shimmer.dart';

Widget orderDetailsShimmer() {
  return SingleChildScrollView(
    child: Container(
      color: CommonColor.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 14,
              right: 20,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                            child: const TextWidget(
                                text: AppStrings.orderNumber + " :",
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
                            child: const TextWidget(
                                text: "#285565465",
                                color: CommonColor.textColorBalck1,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.white,
                            child: const TextWidget(
                                text: AppStrings.orderDate + " :",
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
                            child: const TextWidget(
                                text: "10 May 2023",
                                color: CommonColor.textColorBalck1,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: const TextWidget(
                            text: AppStrings.shipmentOfOneOfOne,
                            color: CommonColor.textColorBalck1,
                            maxLine: 1,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: const TextWidget(
                            text: "1 " + AppStrings.items,
                            color: CommonColor.textColorBalck1,
                            maxLine: 1,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  const MySeparator(
                      color: CommonColor.greyBottomNavContentColorInactive),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: CommonColor.textColorGreen1,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check,
                            color: CommonColor.whiteColor,
                            size: 18,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: SizeConfig.fullWidth,
                        height: 1,
                        color: CommonColor.lightGreyForTextField,
                      )),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: CommonColor.textColorGreen1,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.check,
                            color: CommonColor.whiteColor,
                            size: 18,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: SizeConfig.fullWidth,
                        height: 1,
                        color: CommonColor.lightGreyForTextField,
                      )),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: CommonColor.lightGreyForTextField,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        // child: Icon(
                        //   Icons.check,
                        //   color: CommonColor.whiteColor,
                        // ),
                      ),
                      Expanded(
                          child: Container(
                        width: SizeConfig.fullWidth,
                        height: 1,
                        color: CommonColor.lightGreyForTextField,
                      )),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              color: CommonColor.lightGreyForTextField,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          // child: Icon(
                          //   Icons.check,
                          //   color: CommonColor.whiteColor,
                          // ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TextWidget(
                          text: AppStrings.confirmed,
                          color: CommonColor.greyBottomNavContentColorInactive,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                      const TextWidget(
                          text: AppStrings.shipped,
                          color: CommonColor.greyBottomNavContentColorInactive,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                      const TextWidget(
                          text: AppStrings.outForDelivery,
                          color: CommonColor.greyBottomNavContentColorInactive,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                      const TextWidget(
                          text: AppStrings.delivered,
                          color: CommonColor.greyBottomNavContentColorInactive,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const MySeparator(
                      color: CommonColor.greyBottomNavContentColorInactive),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.white,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/60x60"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(4, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.white,
                              child: TextWidget(
                                  text: AppStrings.productContent,
                                  color: CommonColor.greyAppBarTextColor,
                                  maxLine: 2,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.white,
                                  child: TextWidget(
                                      text: "₹ 18740.00",
                                      color: CommonColor
                                          .blueBottomNavContentColorActive,
                                      maxLine: 1,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.white,
                                  child: TextWidget(
                                      text: "QTY : 1",
                                      color: CommonColor.greyAppBarTextColor,
                                      maxLine: 1,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.white,
                                  child: TextWidget(
                                      text: "SIZE : 1Kg",
                                      color: CommonColor.greyAppBarTextColor,
                                      maxLine: 1,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: SizeConfig.fullWidth,
            height: 10,
            color: CommonColor.grayHomeGridViewBg,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    text: AppStrings.shippingAddress,
                    color: CommonColor.greyAppBarTextColor,
                    maxLine: 1,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                const SizedBox(
                  height: 8,
                ),
                const MySeparator(
                    color: CommonColor.greyBottomNavContentColorInactive),
                const SizedBox(
                  height: 8,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: TextWidget(
                      text: "SK Bhoi",
                      color: CommonColor.greyAppBarTextColor,
                      maxLine: 1,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: SizeConfig.fullWidth! * 0.65,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.white,
                    child: TextWidget(
                        text:
                            "BK- 147, Ground Floor, near SOS Children’s Village, BK Block, Sector II, Bidhannagar, Kolkata, West Bengal 700091",
                        color: CommonColor.greyBottomNavContentColorInactive,
                        maxLine: 4,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: TextWidget(
                      text: "Phone: +91 9883960290",
                      color: CommonColor.greyAppBarTextColor,
                      maxLine: 1,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: SizeConfig.fullWidth,
            height: 10,
            color: CommonColor.grayHomeGridViewBg,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    text: AppStrings.orderSummary,
                    color: CommonColor.greyAppBarTextColor,
                    maxLine: 1,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                SizedBox(
                  height: 8,
                ),
                const MySeparator(color: Colors.grey),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: AppStrings.orderTotal,
                        color: CommonColor.greyBottomNavContentColorInactive,
                        maxLine: 1,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: TextWidget(
                          text: '₹ 1000',
                          color: CommonColor.greyBottomNavContentColorInactive,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: AppStrings.shippingCharges,
                        color: CommonColor.greyBottomNavContentColorInactive,
                        maxLine: 1,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: TextWidget(
                          text: '₹ 50',
                          color: CommonColor.greyBottomNavContentColorInactive,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: AppStrings.discount,
                        color: CommonColor.greyBottomNavContentColorInactive,
                        maxLine: 1,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: TextWidget(
                          text: '₹ 100',
                          color: CommonColor.greyBottomNavContentColorInactive,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                const MySeparator(color: Colors.grey),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: AppStrings.grandTotal,
                        color: CommonColor.greyAppBarTextColor,
                        maxLine: 1,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: TextWidget(
                          text: '₹ 1039.00',
                          color: CommonColor.greyAppBarTextColor,
                          maxLine: 1,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    ),
  );
}
