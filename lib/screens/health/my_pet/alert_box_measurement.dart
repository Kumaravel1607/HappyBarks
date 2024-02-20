import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

import 'my_pet_screen.dart';

class AlertBoxMeasurement extends StatefulWidget {
  AlertBoxMeasurement({Key? key}) : super(key: key);

  @override
  State<AlertBoxMeasurement> createState() => _AlertBoxMeasurement();

}

class _AlertBoxMeasurement extends State<AlertBoxMeasurement> {


  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      title: Column(
        children: [
          Text("Add Measurement",
              style: TextStyle(
                  color: CommonColor.textColorBlack,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.black45)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 10),
                        child: Text(
                          "${selectedDate.toLocal()}"
                              .split(' ')[0],
                          style: const TextStyle(fontFamily: AppStrings.poppins,fontSize: 14,fontWeight: FontWeight.w500,
                              color: CommonColor
                                  .textColorBlack),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.calendar_month,
                        color: CommonColor.blackColor,
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.black45)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black45),
                      borderRadius:
                      BorderRadius.circular(20)),
                  hintText: "Select Height",
                  // labelStyle: TextStyle(color: Colors.white),

                  hintStyle: TextStyle(
                      color:
                      CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)),
              style: const TextStyle(
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.black45)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black45),
                      borderRadius:
                      BorderRadius.circular(20)),
                  hintText: "Select Weight",
                  // labelStyle: TextStyle(color: Colors.white),

                  hintStyle: TextStyle(
                      color:
                      CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)),
              style: const TextStyle(
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 60,
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.black45)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black45),
                      borderRadius:
                      BorderRadius.circular(20)),
                  hintText: "Select Temperature",
                  // labelStyle: TextStyle(color: Colors.white),

                  hintStyle: TextStyle(
                      color:
                      CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)),
              style: const TextStyle(
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();

            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(10),
                  color: CommonColor
                      .blueBottomNavContentColorActive),
              child: Center(
                child: Text("ADD",
                    style: TextStyle(
                        color: CommonColor.whiteColor,
                        fontFamily:
                        AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
