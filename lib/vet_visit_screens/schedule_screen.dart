import 'package:flutter/material.dart';
import 'package:happy_bark/screens/health/my_pet/my_pet_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/vet_visit_screens/vet_visits_screen.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  TextEditingController etCount = TextEditingController(text: "0");

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  List<String> scheduleDate = [
    "24/5/2023",
    "4/6/2023",
    "13/8/2023",
    "19/12/2023",
  ];

  List<String> scheduleSubTitle = [
    "Deworming",
    "DHPPiL Vaccine",
    "Bath",
    "Medicine",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: _buildTabBar()),
        leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyPetScreen()));
              },
            )),
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "Schedule",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            // _buildTabBar(),



            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "Tomorrow",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListView.separated(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return _buildVetVisitsList(
                    "LaLu", scheduleDate[index], scheduleSubTitle[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(
                height: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "In Next 30 Days",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListView.separated(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return _buildVetVisitsList(
                    "LaLu", scheduleDate[index], scheduleSubTitle[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(
                height: 12,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Text(
                "In Next 1 Year",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            ListView.separated(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return _buildVetVisitsList(
                    "LaLu", scheduleDate[index], scheduleSubTitle[index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(
                height: 12,
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildTabBar() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.shade300),
      child: TabBar(
        // isScrollable: true,
        controller: tabController,
        indicatorWeight: 5,
        labelColor: Colors.black,
        tabs: [
          Tab(
            text: 'Upcoming',
          ),
          Tab(
            text: 'Overdue',
          ),
          Tab(
            text: 'Done',
          ),
        ],
      ),
    );
  }

  Widget _buildVetVisitsList(String title, String scheduleDate, String scheduleSubtitle,) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Padding(
        padding: EdgeInsets.only(top: 15.0, bottom: 15, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  scheduleSubtitle,
                  style: TextStyle(
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                )
              ],
            ),
            Text(
              scheduleDate,
              style: TextStyle(
                  color: CommonColor.textColorBlack,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
