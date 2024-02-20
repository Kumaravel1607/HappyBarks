

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

Widget buildBuyingProcess() {
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
                  "Buying Process",
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w700,
                      fontSize: 12)
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
          SizedBox(
            height: 20,
          ),
          Text(
              "Pay 5% advance & rest on delivery.",
              style: TextStyle(
                  color: CommonColor.textColorBlack,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w400,
                  fontSize: 10)
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "Health certificates will be made available on whatsapp",
              style: TextStyle(
                  color: CommonColor.textColorBlack,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w400,
                  fontSize: 10)
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "Contact to know more",
              style: TextStyle(
                  color: CommonColor.textColorBlack,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: TextFormField(
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                  // style: TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    border: InputBorder.none,
                    hintText: "Name",
                    hintStyle:TextStyle(
                        color: CommonColor.greyBottomNavContentColorInactive,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: TextFormField(
                        style: TextStyle(
                            color: CommonColor.textColorBlack,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: CommonColor.greyBottomNavContentColorInactive,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w400,
                              fontSize: 10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: TextFormField(
                        style:
                        TextStyle(fontSize: 12, color: Colors.black),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                            hintText: "Phone No",
                            hintStyle: TextStyle(
                                color: CommonColor.greyBottomNavContentColorInactive,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w400,
                                fontSize: 10)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: TextFormField(
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      border: InputBorder.none,
                      hintText: "Looking for breed",
                      hintStyle: TextStyle(
                          color: CommonColor.greyBottomNavContentColorInactive,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w400,
                          fontSize: 10)      ,
                      suffixIcon: Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                        color: Colors.black,
                      )),
                ),
              )
            ],
          ),
        ]),
  );
}