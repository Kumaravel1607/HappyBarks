import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/model/core_vaccine_model.dart';
import 'package:happy_bark/screens/health/my_pet/my_pet_screen.dart';
import 'package:happy_bark/utils/colors.dart';

import 'package:happy_bark/utils/strings.dart';
import 'package:intl/intl.dart';

class AddVaccineDetailsScreen extends StatefulWidget {
  AddVaccineDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddVaccineDetailsScreen> createState() =>
      _AddVaccineDetailsScreenState();
}

class _AddVaccineDetailsScreenState extends State<AddVaccineDetailsScreen> {
  DateTime selectedDates = DateTime.now();
  bool isSelected1 = false;
  bool isSelected2 = false;
  Future<void> _selectDatesCore(BuildContext context, CoreVaccine date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023, 1),
      lastDate: DateTime(2101),
    );

    print("object");
    setState(() {
      date.date = DateFormat("dd/MM/yyyy").format(picked!);
    });
  }

  List<CoreVaccine> coreVaccineList = [];
  Future<void> _selectDatesNonCore(
      BuildContext context, CoreVaccine date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023, 1),
      lastDate: DateTime(2101),
    );

    print("object");
    setState(() {
      date.date = DateFormat("dd/MM/yyyy").format(picked!);
    });
  }

  List<CoreVaccine> NonCoreVaccineList = [];
  List<String> coreVaccines = [
    "DHPPi L(Distemper, Hepatitis, Paravovirus and Parainfluenza )",
    "DHPPi L: Booster 1",
    "DHPPi L: Booster 2+ Rabbies",
    "DHPPi L + Kennel Cough",
    "Bordetella, Leptospirosis",
    "Add"
  ];
  List<String> NonCoreVaccines = [
    "Bordetella",
    "Paralnfluenza, Leptospirosis, Bordetella, Lyme disease per lifestyle as recommended by veterinarian",
    "Paralnfluenza, Lyme disease. Leptospirosis, Bordetella per lifestyle",
    "Coronavirus, Leptospirosis,Bordetella, Lyme disease",
    "Influenza, Coronavirus,Lyme disease",
    "Add"
  ];

  List<bool> statusList1 = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> statusList2 = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> statusList3 = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  void initState() {
    // TODO: implement initState
    generateCoreList();
    generateNonCoreList();
    super.initState();
  }

  generateCoreList() {
    coreVaccines.forEach((element) {
      coreVaccineList.add(CoreVaccine(
          vaccineName: element,
          date: "",
          isSwitchSelected: false,
          notificationValue: "",
          vaccineWeek: "6-7 Week"));
    });
  }

  generateNonCoreList() {
    NonCoreVaccines.forEach((element) {
      NonCoreVaccineList.add(CoreVaccine(
          vaccineName: element,
          date: "",
          isSwitchSelected: false,
          notificationValue: "",
          vaccineWeek: "6-7 Week"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyPetScreen()));
              }),
        ),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "Add Vaccine Details",
          style: TextStyle(
              color: CommonColor.greyBottomNavContentColorInactive,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w400,
              fontSize: 12),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.search,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.home_outlined,
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black54,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
              ),
              Text(
                "Add Vaccine Details",
                style: TextStyle(
                    color: CommonColor.blueBottomNavContentColorActive,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              Text(
                "Core Vaccines(Highly Recommended)",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.0,
                  children: List.generate(
                    coreVaccineList.length,
                    (index) => coreVaccineList[index].vaccineName != "Add"
                        ? _buildCoreVaccines(coreVaccineList[index])
                        : Container(
                            height: 108,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade200),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        onSurface: CommonColor
                                            .blueBottomNavContentColorActive,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                Padding(
                                  padding: EdgeInsets.only(left: 24, right: 24),
                                  child: Text(
                                    "Add A New \nCore Vaccine",
                                    style: TextStyle(
                                        color: CommonColor.textColorBlack,
                                        fontFamily: AppStrings.poppins,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                "Non-Core/Optional Vaccines",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                height: 15,
              ),
              GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.0,
                  children: List.generate(
                    NonCoreVaccineList.length,
                    (index) => NonCoreVaccineList[index].vaccineName != "Add"
                        ? _buildNonCoreVaccines(NonCoreVaccineList[index])
                        : Container(
                            height: 108,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.red.shade50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        onSurface: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)))),
                                Padding(
                                  padding: EdgeInsets.only(left: 24, right: 24),
                                  child: Text(
                                    "Add A New \nCore Vaccine",
                                    style: TextStyle(
                                        color: CommonColor.textColorBlack,
                                        fontFamily: AppStrings.poppins,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                  )),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: CommonColor.blueBottomNavContentColorActive,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCoreVaccines(CoreVaccine datum) {
    return Column(
      children: [
        Container(
          height: 108,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
              color: Colors.grey.shade200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scaleY: 0.8,
                      scaleX: 0.8,
                      child: CupertinoSwitch(
                        trackColor: Colors.grey.shade300,
                        thumbColor: Colors.grey.shade300,
                        activeColor:
                            CommonColor.blueBottomNavContentColorActive,
                        value: datum.isSwitchSelected!,
                        onChanged: (value) =>
                            setState(() => datum.isSwitchSelected = value),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                title: Text(
                                  'Paralnfluenza, Leptospirosis,\nBordetella, Lyme disease per lifestyle as recommended by veterinarian',
                                  style: TextStyle(
                                      color: CommonColor.textColorBlack,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 20),
                                      child: Text(
                                        "The rabies vaccine is a vaccine used to prevent rabies. There are a number of rabies vaccines available that are both safe and effective. They can be used to prevent rabies before, and, for a period of time, after exposure to the rabies virus, which is commonly caused by a dog bite or a bat bite.",
                                        style: TextStyle(
                                            color: CommonColor.textColorBlack,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10),
                                      ),
                                    ),
                                    Container(
                                      height: 37,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20)),
                                        color: CommonColor
                                            .blueBottomNavContentColorActive,
                                      ),
                                      width: double.infinity,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 10),
                                          child: Text(
                                            'When to take: Every Year 1 year onwards',
                                            style: TextStyle(
                                                color: CommonColor.whiteColor,
                                                fontFamily: AppStrings.poppins,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // actions: [
                                //
                                // ],
                              );
                            });
                      },
                      child: Image(
                          image: AssetImage(
                        "assets/images/Info_image.png",
                      )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 10, bottom: 10),
                child: Text(
                  datum.vaccineName ?? "",
                  maxLines: 2,
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.amber.shade600,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "6-7 Weeks",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ),
                Visibility(
                  visible: datum.date!.isEmpty ? true : false,
                  replacement: InkWell(
                    onTap: () {
                      _selectDatesCore(context, datum);
                    },
                    child: Text(
                      datum.date ?? "",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.calendar_month,
                      color: CommonColor.whiteColor,
                    ),
                    onPressed: () {
                      _selectDatesCore(context, datum);
                      ThemeData.light().copyWith(
                          primaryColorLight: Colors.red,
                          textButtonTheme: TextButtonThemeData());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNonCoreVaccines(CoreVaccine datum) {
    return Column(
      children: [
        Container(
          height: 108,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
              color: Colors.red.shade50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.scale(
                      scaleY: 0.8,
                      scaleX: 0.8,
                      child: CupertinoSwitch(
                        trackColor: Colors.grey.shade300,
                        thumbColor: Colors.grey.shade300,
                        activeColor:
                            CommonColor.blueBottomNavContentColorActive,
                        value: datum.isSwitchSelected!,
                        onChanged: (value) =>
                            setState(() => datum.isSwitchSelected = value),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                title: Text(
                                  'Paralnfluenza, Leptospirosis,\nBordetella, Lyme disease per lifestyle as recommended by veterinarian',
                                  style: TextStyle(
                                      color: CommonColor.textColorBlack,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, bottom: 20),
                                      child: Text(
                                        "The rabies vaccine is a vaccine used to prevent rabies. There are a number of rabies vaccines available that are both safe and effective. They can be used to prevent rabies before, and, for a period of time, after exposure to the rabies virus, which is commonly caused by a dog bite or a bat bite.",
                                        style: TextStyle(
                                            color: CommonColor.textColorBlack,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 10),
                                      ),
                                    ),
                                    Container(
                                      height: 37,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20)),
                                        color: CommonColor
                                            .blueBottomNavContentColorActive,
                                      ),
                                      width: double.infinity,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 10),
                                          child: Text(
                                            'When to take: Every Year 1 year onwards',
                                            style: TextStyle(
                                                color: CommonColor.whiteColor,
                                                fontFamily: AppStrings.poppins,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                // actions: [
                                //
                                // ],
                              );
                            });
                      },
                      child: Image(
                          image: AssetImage(
                        "assets/images/Info_image.png",
                      )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 10, bottom: 10),
                child: Text(
                  datum.vaccineName ?? "",
                  maxLines: 2,
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "6-7 Weeks",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ),
                Visibility(
                  visible: datum.date!.isEmpty ? true : false,
                  replacement: InkWell(
                    onTap: () {
                      _selectDatesCore(context, datum);
                    },
                    child: Text(
                      datum.date ?? "",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.calendar_month,
                      color: CommonColor.whiteColor,
                    ),
                    onPressed: () {
                      _selectDatesNonCore(context, datum);
                      ThemeData.light().copyWith(
                          primaryColorLight: Colors.red,
                          textButtonTheme: TextButtonThemeData());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
