import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildPhotosContainer() {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: [
        Container(
            height: 280,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade300)),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 74,
                width: 74,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300)),
            SizedBox(
              width: 8,
            ),
            Container(
                height: 74,
                width: 74,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300)),
            SizedBox(
              width: 8,
            ),
            Container(
                height: 74,
                width: 74,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300)),
            SizedBox(
              width: 8,
            ),
            Container(
                height: 74,
                width: 74,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300)),
          ],
        ),
      ],
    ),
  );
}