import 'package:flutter/material.dart';
import 'package:happy_bark/screens/home/home_screen.dart';
import 'package:happy_bark/screens/pet_details/pet_details_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

class BuyPetScreen extends StatelessWidget {
  const BuyPetScreen({Key? key}) : super(key: key);

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
                        builder: (context) => HomePage()));
              },
            )),
        title: Text("Buy Pets",
            style: TextStyle(
                color: CommonColor.greyBottomNavContentColorInactive,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w400,
                fontSize: 12)),
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
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text("Suggestions",
                  style: TextStyle(
                      color: CommonColor.primaryColorCabBook,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildSuggestion("Indie Dog"),
                  SizedBox(
                    width: 10,
                  ),
                  _buildSuggestion("German Shepherd"),
                  SizedBox(
                    width: 10,
                  ),
                  _buildSuggestion("  Pug  "),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildSuggestion(" Beagle "),
                  SizedBox(
                    width: 10,
                  ),
                  _buildSuggestion("Golden Retriver"),
                  SizedBox(
                    width: 10,
                  ),
                  _buildSuggestion("  Labrador  "),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              ListView.separated(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return _buildGermanShepherdPuppyProfile(context);
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 14,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/images/sort_image.png")),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Sort",
                      style: TextStyle(
                          color: CommonColor.whiteColor,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 14)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      "assets/images/filter_image.png",
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Filter",
                      style: TextStyle(
                          color: CommonColor.whiteColor,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 14))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildSuggestion(String title) {
    return Column(
      children: [
        Container(
          // height: 47,
          // width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
            child: Text(title,
                style: TextStyle(
                    color: CommonColor.primaryColorCabBook,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 12)),
          ),
        )
      ],
    );
  }

  Widget _buildGermanShepherdPuppyProfile(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 155,
          width: 155,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/german_shepherd_puppy_image.png"))),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("German Shepherd Puppy",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 14)),
                Text("2 Months ",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w400,
                        fontSize: 12)),
                Text("Starting Price Rs.18,000",
                    style: TextStyle(
                        color: CommonColor.textColorBlack,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w600,
                        fontSize: 12)),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PetDetailsScreen()));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 18, right: 18, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: CommonColor.iconColorAmber),
                    child: Text("KNOW MORE",
                        style: TextStyle(
                            color: CommonColor.whiteColor,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w600,
                            fontSize: 13)),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
