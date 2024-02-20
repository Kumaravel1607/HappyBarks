
import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

Widget getContent() {
  return Padding(
    padding: EdgeInsets.only(left: 35, right: 35),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
            "AFFECTIONATE WITH FAMILY",
            style: TextStyle(
                color: CommonColor.textColorBlack,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 10)
        ),

        Text(
            "How affectionate a breed is likely to be with family members, or other people he knows well. Some breeds can be aloof with everyone but their owner, while other breeds treat everyone they know like their best friend.",
            style: TextStyle(
                color: CommonColor.textColorBlack,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 10)
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            "GOOD WITH YOUNG CHILDREN",
            style: TextStyle(
                color: CommonColor.textColorBlack,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 10)
        ),

        Text(
            "A breed's level of tolerance and patience with childrens’ behavior, and overall family-friendly nature. Dogs should always be supervised around young children, or children of any age who have little exposure to dogs.",
            style: TextStyle(
                color: CommonColor.textColorBlack,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 10)
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            "GOOD WITH OTHER DOGS",
            style: TextStyle(
                color: CommonColor.textColorBlack,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 10)
        ),

        Text(
            "How generally friendly a breed is towards other dogs.Dogs should always be supervised for interactions and introductions with other dogs, but some breeds are innately more likely to get along with other dogs, both at home and in public.",
            style: TextStyle(
                color: CommonColor.textColorBlack,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 10)
        ),
      ],
    ),
  );
}