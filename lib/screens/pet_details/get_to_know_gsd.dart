


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

Widget buildGetToKnowGSD() {
  return Padding(
    padding: EdgeInsets.only(left: 35, right: 35),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Get to Know GSD fd",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w700,
                    fontSize: 12)),
            InkWell(
                onTap: () {},
                child: Container(
                  width: 15,
                  height: 2,
                  color: Colors.black,
                )),
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
        SizedBox(
          height: 8,
        ),
        Text(
            "An intelligent, lively, and steadfast breed, the German Shepherd fulfills so much that’s wanted in a dog. Devoted to their owner and to their family, this is a dog who will follow you from room to room, into the car, really anywhere you go.\nThe energy level of the German Shepherd? High. But that can also equate to fun, as the breed looks upon any activity as welcome activity. Walking, running, all work for the German Shepherd, as do tracking and agility competitions, which they excel at. If there's one characteristic that defines the German Shepherd, it's their smarts. They are known for having incredibly high intelligence and the ability to figure disabled or visually impaired persons. rney re iaeally suited for the role given their unwavering loyalty, smarts, and keen sense of smell. \nTrain them well and this breed will return your requests in spades. As singularly self-assured as they are, the breed is also known to be a great companion dog. They are incredibly bonded to their owner, so teaching your German Shepherd won't be hard, it just needs to be consistent.\n The other breed hallmark: that coat! It's a double one, and composed of thick, plush fur dappled with distinctive, rich colorings that give the German Shepherd breed their regal look.",
            style: TextStyle(
                color: CommonColor.textColorBlack,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 10))
      ],
    ),
  );
}