import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/vet_visit_screens/medicine_screen.dart';
import 'package:happy_bark/vet_visit_screens/tick_and_flea_screen.dart';

class DewormingScreen extends StatelessWidget {
   DewormingScreen({Key? key}) : super(key: key);

  List<String> dewormingDate = [
    "24/5/2023",
    "4/6/2023",
  ];
  List<String> dewormingStatus = [
    "Done",
    "Due",
  ];
  List<String> dewormingTitle = [
    "Deworming",
    "dDeworming",
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
                        builder: (context) => MedicineScreen()));
              },
            )),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "Deworming",
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
              "Deworming",
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
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return _buildVetVisitsList(dewormingTitle[index],dewormingDate[index],
                    dewormingStatus[index], "Edit");
              }, separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 12,) ,),
          ],
        ),
      ),

    );

  }

  Widget _buildVetVisitsList(String dewormingTitle, String dewormingDate,
      String dewormingStatus, String edit,) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dewormingTitle,
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                Text(
                  dewormingDate,
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
                  dewormingStatus,
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

