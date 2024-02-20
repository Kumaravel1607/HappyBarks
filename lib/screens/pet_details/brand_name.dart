

import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

Widget buildBrandName() {
  return Padding(
    padding: EdgeInsets.only(left: 35, right: 35),
    child: Column(
      children: [
        Container(
          height: 45,
          width: double.infinity,
          color: CommonColor.redColors,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                  child: Text(
                      "Breed Name",
                      style: TextStyle(
                          color: CommonColor.whiteColor,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )
                  ),
                ),
                Expanded(
                  child: Text(
                      "German  Shepherd",
                      style: TextStyle(
                          color: CommonColor.whiteColor,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
        Table(
            border: TableBorder.symmetric(
                outside: BorderSide.none,
                inside: BorderSide(width: 0.8, color: Colors.black54)),
            // Allows to add a border decoration around your table
            children: const [
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                  Text('Origin ', style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 12
                  )),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                  Text('Germany', style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 12
                  )),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Breed Group',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Working Group',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Height',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Male: 60-65 cm Female: 55-60',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Weight',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Male: 30-40 kg Female:22-32 kg',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'LifeSpan',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('9-13 Years',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Temperament',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Intelligent, Amiable,Temperament moderately active,Determined, Excitable',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Apartment Friendly',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                  Text('Highly',
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12
                      )                    ),
                ),
              ]),
            ]),
      ],
    ),
  );
}