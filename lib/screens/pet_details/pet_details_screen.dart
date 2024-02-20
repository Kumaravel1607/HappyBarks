import 'package:flutter/material.dart';
import 'package:happy_bark/screens/buy_pet/buy_pet_screen.dart';
import 'package:happy_bark/screens/pet_details/about_this_puppy.dart';
import 'package:happy_bark/screens/pet_details/brand_name.dart';
import 'package:happy_bark/screens/pet_details/buying_process.dart';
import 'package:happy_bark/screens/pet_details/get_content.dart';
import 'package:happy_bark/screens/pet_details/get_to_know_gsd.dart';
import 'package:happy_bark/screens/pet_details/identifying_the_right_breed.dart';
import 'package:happy_bark/screens/pet_details/photosContainer.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

class PetDetailsScreen extends StatefulWidget {
  const PetDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen>
    with TickerProviderStateMixin {
  TabController? tabController1;
  TextEditingController etCount1 = TextEditingController(text: "0");
      TabController? tabController2;
  TextEditingController etCount2 = TextEditingController(text: "0");

  @override
  void initState() {
    tabController1 = TabController(length: 5, vsync: this);
    tabController2 = TabController(length: 4, vsync: this);
    super.initState();
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BuyPetScreen()));
              },
            )),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
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
            SizedBox(
              height: 20,
            ),
            buildPhotosContainer(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "1 Month Old German Shepherd Puppy",
                style: TextStyle(
                    color: CommonColor.blueBottomNavContentColorActive,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                text: TextSpan(
                    text: "Age:",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                    children: [
                      TextSpan(
                          text: " 1 Month",
                          style: TextStyle(
                              color: CommonColor.textColorBlack,
                              fontFamily: AppStrings.poppins,
                              fontWeight: FontWeight.w700,
                              fontSize: 12))
                    ]),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            buildGetToKnowGSD(),
            SizedBox(height: 15,),
            buildBrandName(),
            _buildFActsAboutGsd(context),
            buildIdentifyingTheRightBreed(),
            SizedBox(height: 20,),
            _buildAboutThisPuppy(),
            buildBuyingProcess(),
            SizedBox(height: 10,),
            InkWell(
              onTap: () {},
              child: Container(
                margin:
                EdgeInsets.only(left: 35, right: 35,),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal.shade300),
                child: Center(
                  child: Text(
                    "Enquire Now",
                    textAlign: TextAlign.center,
                      style: TextStyle(
                          color: CommonColor.whiteColor,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w700,
                          fontSize: 12)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Expanded(flex: 4,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: (){
                              if(int.parse(etCount1.text)==0)
                              {
                                return;
                              }
                              etCount1.text=(int.parse(etCount1.text)-1).toString();
                            },child: Icon(Icons.remove,)),
                        SizedBox(

                            width: 30,
                            child: TextField(
                              maxLength: 2,
                              controller: etCount1,
                              readOnly: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 7),
                                  border: InputBorder.none,
                                  isDense: true,
                                  counter: Offstage()
                              ),
                            )),  InkWell(
                          onTap: (){

                            etCount1.text=(int.parse(etCount1.text)+1).toString();
                          },child: const Icon(Icons.add),)

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(flex: 6,
                child: Container(
                  height: 45,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      "Add to card",
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildFActsAboutGsd(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 30),
                child: Text(
                  "Facts About GSD",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w700,
                        fontSize: 12)
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey.shade300),
          child: TabBar(
            isScrollable: true,
            controller: tabController1,
            indicatorWeight: 5,
            labelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'Family Life',
              ),
              Tab(
                text: 'Physical',
              ),
              Tab(
                text: 'Social',
              ),
              Tab(
                text: 'Personality ',
              ),
              Tab(
                text: 'All Traits',
              ),
            ],
          ),
        ),
        Container(
          height: 320,
          width: double.infinity,
          child: TabBarView(
            controller: tabController1,
            children: <Widget>[
              getContent(),
              getContent(),
              getContent(),
              getContent(),
              getContent(),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildAboutThisPuppy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey.shade300),
          child: TabBar(
            isScrollable: true,
            controller: tabController2,
            labelColor: Colors.black,
            indicatorWeight: 5,
            labelStyle: TextStyle(height: 1.4),
            tabs: [
              Tab(
                text: 'About This \nPuppy',
              ),
              Tab(
                text: 'Vaccination to \nPuppy',
              ),
              Tab(
                text: 'Vet \n Consul',
              ),
              Tab(
                text: 'We get you \ncover ',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 210,
          width: double.infinity,
          child: TabBarView(
            controller: tabController2,
            children: <Widget>[
              aboutThisPuppy(),
              aboutThisPuppy(),
              aboutThisPuppy(),
              aboutThisPuppy(),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Meals",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
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
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "0-2 Months (New Born): Breast Milk",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),
              ),
              SizedBox(
                height: 15,
              ),
              Text("2-15 Months (Puppy)",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 10),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Puppy Age \n2-4 months old \n4-6 months old \n6-15 months old ",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,height: 1.5),),
                  Text(
                      "Feeding Frequency \n4 or 5 times a day \n3 times a day \n2 times a day",
                      style: TextStyle(
                          color: CommonColor.textColorBlack,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,height: 1.5),),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Above 15 Months \n(Adult) ",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,height: 1.5),),
                  Text("1700 calories daily \n2 times a day",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,height: 1.5),)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Senior Age 8+ Years\n(Senior)",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,height: 1.5),),
                  Text("  1200 Calories \n    2 times a day",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,height: 1.5),)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Puppy Age\n(Weeks)",
                            style: TextStyle(
                                color: CommonColor.textColorBlack,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,height: 1.5),
                          ),
                          Text("Feeding\nPer day",
                            style: TextStyle(
                                color: CommonColor.textColorBlack,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),),
                          Text("Amount Per\nFeeding",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5)),
                          Text("Time Gap",
                            style: TextStyle(
                                color: CommonColor.textColorBlack,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("1\n2\n3\n4",
                            style: TextStyle(
                                color: CommonColor.textColorBlack,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),),
                          SizedBox(
                            width: 40,
                          ),
                          Text("8\n5\n5\n4",
                            style: TextStyle(
                                color: CommonColor.textColorBlack,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),),
                          SizedBox(
                            width: 15,
                          ),
                          Text("10-12ml\n30-35ml\n70-80ml\n100-120ml",
                              style: TextStyle(
                                  color: CommonColor.textColorBlack,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),),
                          Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text(
                                "Every 2 hrs\nEvery 4-5 hrs\nEvery 4-5 hrs\nEvery 4-5 hrs\n",
                              style: TextStyle(
                                  color: CommonColor.textColorBlack,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Which Baby Dog Milk Should | Feed My Newborn German Shepherd Puppy? \nYou can find various milk replacers in the market for puppies. Yet the one which stands out in terms of quality and nutrition is Royal Canin Baby Dog Milk which has a dietary profile similar to that of maternal milk. The benefits of Royal Canin Baby Dog Milk: \nOffers high energy and protein levels. \nDHA boosts cognitive skills and nervous functioning in pups. Exclusive homogeneous formula of milk makes it easier to diges \n1-2 Months \nGerman Shepherd pups can be given starter dog food after they complete their first month. A starter food is a moistened dry dog food that acts as an ideal transition from mother’s milk to solid kibble.",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    );
  }
}


