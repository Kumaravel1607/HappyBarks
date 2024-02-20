

import 'package:flutter/cupertino.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

Widget aboutThisPuppy() {
  return Padding(
    padding: EdgeInsets.only(left: 35, right: 35),
    child: Text(
      "1. An incredible sense of smell\nThe German Shepherd breed is one of the leaders in olfactory abilities - that means smell. They are traditionally used to perform search and rescue, and for bomb and drug sniffing in police and military work because of this keen characteristic.\n2. Speaking of noses...\nBred as a herding dog, the German Shepherd is known for rounding up not only other animals but even humans. They'll nudge you with their nose - when they want to go out, go for a walk, or when it's mealtime. It's a charming and harmless trait, and could be handy where little ones are concerned as the German Shepherd tends to be highly protective, too.",
      style: TextStyle(
          color: CommonColor.textColorBlack,
          fontFamily: AppStrings.poppins,
          fontWeight: FontWeight.w500,
          fontSize: 10),
    ),
  );
}