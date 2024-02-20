

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

Widget buildIdentifyingTheRightBreed() {
  return Padding(
    padding: EdgeInsets.only(left: 35, right: 35),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Identifying the Right Breed",
              style: TextStyle(
                  color: CommonColor.textColorBlack,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 15,
                height: 2,
                color: Colors.black,
              ),
            )
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black,
        ),
        Center(
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/gsd_numbering_image.png",
                  ),
                )),
          ),
        ),
        Text(
          "1.Ears:Ears pert ending in point, slant forward to frame face.",
          style: TextStyle(
              color: CommonColor.textColorBlack,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 10),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "2.Head: Well-proportioned wedge-shaped head, strong muzzle",
          style: TextStyle(
              color: CommonColor.textColorBlack,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 10),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "3.Fur:Thick undercoat, coarse top coat, distinctive colourings of deep black and tan, silver, and white.",
          style: TextStyle(
              color: CommonColor.textColorBlack,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 10),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "4.Body:Muscular, strong body, lanky with sense of balance and even proportion, firm ribs and chest, not stocky.",
          style: TextStyle(
              color: CommonColor.textColorBlack,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 10),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "5.Tail:Thick, long hair on tail, slightly longer on underside.",
          style: TextStyle(
              color: CommonColor.textColorBlack,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 10),
        )
      ],
    ),
  );
}