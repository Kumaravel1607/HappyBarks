import 'package:flutter/material.dart';
import 'package:happy_bark/screens/health/add_new_pet_screen.dart';
import 'package:happy_bark/screens/health/my_pet/alert_box.dart';
import 'package:happy_bark/screens/health/my_pet/alert_box_hyegine.dart';
import 'package:happy_bark/screens/health/my_pet/alert_box_measurement.dart';
import 'package:happy_bark/screens/health/my_pet/alert_box_medicine.dart';
import 'package:happy_bark/screens/health/my_pet/alert_box_report.dart';
import 'package:happy_bark/screens/health/my_pet/alert_box_surgery.dart';
import 'package:happy_bark/screens/health/pet_profile_screen.dart';
import 'package:happy_bark/screens/vaccine/add_vaccine_details_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/vet_visit_screens/deworming_screen.dart';
import 'package:happy_bark/vet_visit_screens/hyegine_screen.dart';
import 'package:happy_bark/vet_visit_screens/measurements_screen.dart';
import 'package:happy_bark/vet_visit_screens/medicine_screen.dart';
import 'package:happy_bark/vet_visit_screens/report_screen.dart';
import 'package:happy_bark/vet_visit_screens/schedule_screen.dart';
import 'package:happy_bark/vet_visit_screens/surgeries_screen.dart';
import 'package:happy_bark/vet_visit_screens/tick_and_flea_screen.dart';
import 'package:happy_bark/vet_visit_screens/vet_visits_screen.dart';

class MyPetScreen extends StatefulWidget {
  MyPetScreen({Key? key}) : super(key: key);

  @override
  State<MyPetScreen> createState() => _MyPetScreenState();
}

class _MyPetScreenState extends State<MyPetScreen> {
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

  List<String> title = [
    "Vaccination",
    "Deworming",
    "Tick & Flea",
    "Measurements",
    "Hyegine",
    "Medicines",
    "Reports",
    "Vet Visits",
    "Surgeries",
  ];
  List<String> subTitle = [
    "V0 Vaccine Recorded",
    "0 Deworming Recorded",
    "0 Tick & Flea Recorded",
    "0 Measurements",
    "0 Hyegine Reminder",
    "0 Medicines",
    "0 Reports",
    "0 Vet Visits",
    "0 Surgeries Recorder",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PetProfileScreen()));
              },
            )),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "My Pet",
          style: TextStyle(
              color: CommonColor.greyBottomNavContentColorInactive,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w500,
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
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              _buildMyPetsRow(context),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 47,
                width: 161,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/images/germen_shepherd_image.png"),
                      ),
                      Text("LaLu",
                          style: TextStyle(
                              color: CommonColor.primaryColorCabBook,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                      Icon(Icons.edit)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              _buildGermanShepherdContainer(),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Lalu’s Health Records",
                          style: TextStyle(
                              color: CommonColor.textColorBlack,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScheduleScreen()));
                          },
                          child: Row(
                            children: [
                              Text(
                                "All Schedule ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              onSurface:
                                  CommonColor.blueBottomNavContentColorActive,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                    ],
                  ),
                  GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                      children: List.generate(9,
                          (index) => _buildLaluHealthRecords(context, index))),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyPetsRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        "My Pets",
        style: TextStyle(
            color: CommonColor.blueBottomNavContentColorActive,
            fontFamily: AppStrings.poppins,
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddNewPetScreen()));
          },
          child: Row(
            children: [
              Text(
                "Add Pet ",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              )
            ],
          ),
          style: ElevatedButton.styleFrom(
              onSurface: CommonColor.blueBottomNavContentColorActive,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
    ]);
  }

  Widget _buildGermanShepherdContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black45)),
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("German Shepherd",
                    style: TextStyle(
                        height: 1.5,
                        color: CommonColor.primaryColorCabBook,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10)),
                Row(
                  children: [
                    Icon(
                      Icons.cake,
                      size: 13,
                    ),
                    Text("1 May, 2022 | 1 Year 1 day",
                        style: TextStyle(
                            color: CommonColor.primaryColorCabBook,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 10))
                  ],
                )
              ],
            ),
            Icon(
              Icons.male_sharp,
              size: 40,
              color: CommonColor.greyBottomNavContentColorInactive,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLaluHealthRecords(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        getRoute(title[index]);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: 90,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/dog_image_vaccines.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18.0, top: 10),
                    child: Text(title[index],
                        style: TextStyle(
                            color: CommonColor.primaryColorCabBook,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 14)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(subTitle[index],
                        style: TextStyle(
                            color: CommonColor.primaryColorCabBook,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 10)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                switch (index) {
                                  case 0:
                                    return AddVaccineDetailsScreen();
                                  case 1:
                                    return AlertBoxScreen("Add Deworming");
                                  case 2:
                                    return AlertBoxScreen("Add Tick & Flea");
                                  case 3:
                                    return AlertBoxMeasurement();
                                  case 4:
                                    return AlertBoxHyegine();
                                  case 5:
                                    return AlertBoxMedicine();
                                  case 6:
                                    return AlertBoxReport();
                                  case 7:
                                    return AlertBoxScreen("Add Vet Visits");
                                  case 8:
                                    return AlertBoxSurgery();
                                  default:
                                    return AlertBoxScreen("");
                                }
                              });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        style: ElevatedButton.styleFrom(
                            onSurface:
                                CommonColor.blueBottomNavContentColorActive,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getRoute(String name) {
    switch (name) {
      case "Vaccination":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext) => AddVaccineDetailsScreen()));
        break;
      case "Deworming":
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => DewormingScreen()));
        break;
      case "Tick & Flea":
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => TickAndFleaScreen()));
        break;
      case "Measurements":
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => MeasurementScreen()));
        break;
      case "Hyegine":
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => HyegineScreen()));
        break;
      case "Medicines":
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => MedicineScreen()));
        break;
      case "Reports":
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => ReportScreen()));
        break;
      case "Vet Visits":
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => VetVisitsScreen()));
        break;
      case "Surgeries":
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext) => SurgeriesScreen()));
        break;
    }
  }
}
