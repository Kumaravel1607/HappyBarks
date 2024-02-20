
import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/vet_visit_screens/report_screen.dart';
import 'package:happy_bark/vet_visit_screens/schedule_screen.dart';

class VetVisitsScreen extends StatelessWidget {
  VetVisitsScreen({Key? key}) : super(key: key);

  List<String> vetVisitsDate = [
    "24/5/2023",
    "4/6/2023",
    "2/1/2023",
  ];
  List<String> vetVisitsStatus = [
    "Done",
    "Due",
    "Due",
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
                        builder: (context) => ScheduleScreen()));
              },
            )),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "Vet Visit",
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
      body: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              "Vet Visits",
              style: TextStyle(
                  color: CommonColor.blueBottomNavContentColorActive,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return _buildVetVisitsList("Vet Visits", vetVisitsDate[index],
                      vetVisitsStatus[index], "Edit");
                }, separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 12,) ,),
          ],
        ),
      ),

    );
  }

  Widget _buildVetVisitsList(String title, String vetVisitsDate, String vetVisitsStatus, String edit,) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                Text(
                  vetVisitsDate,
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  vetVisitsStatus,
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                Text(
                  edit,
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
