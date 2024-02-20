
import 'package:flutter/material.dart';
import 'package:happy_bark/screens/health/my_pet/my_pet_screen.dart';
import 'package:happy_bark/screens/health/snap_a_pic_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

class PetProfileScreen extends StatelessWidget {
  const PetProfileScreen({Key? key}) : super(key: key);

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
                    MaterialPageRoute(builder: (context) => SnapAPicScreen()));
              },
            )),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "Pet Profile",
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
            children: [
              Text(
                "Lalu’s name” profile is ready",
                style: TextStyle(
                    color: CommonColor.blueBottomNavContentColorActive,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              _buildProfilePicContainer(),
              SizedBox(
                height: 24,
              ),
              _buildPetDetails(),
              SizedBox(height: 16,),
              _buildDoneButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicContainer() {
    return Card(
      elevation: 4,
      child: Container(
        height: 354,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 17, right: 17, top: 18),
              height: 262,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/golden_retriever_image.png"),
                      fit: BoxFit.fill)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: []),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17, right: 17, top: 20),
              child: Text(
                "Lalu, 2, May 2023",
                style: TextStyle(
                    color: CommonColor.textColorBlack,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPetDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 38,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
            color: CommonColor.blueBottomNavContentColorActive,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 17.0),
            child: Text(
              "Pet Details",
              style: TextStyle(
                  color: CommonColor.whiteColor,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.grey.shade300),
          child: Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10,right: 17,left: 17),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Type of pet: Dog",
                  style: TextStyle(
                    height: 1.5,
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                Text(
                  "Gender: Male",
                  style: TextStyle(height: 1.5,
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                Text(
                  "Pet's Name: Lalu",
                  style: TextStyle(height: 1.5,
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),Text(
                  "Breed: Golden Retriever",
                  style: TextStyle(height: 1.5,
                      color: CommonColor.textColorBlack,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    return Column(
      children: [
        InkWell(onTap: (){

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyPetScreen()));
        },
          child: Container(
            height: 47,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CommonColor.blueBottomNavContentColorActive),
            child: Center(
              child: Text(
                "Done",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),

          ),
        ),
        SizedBox(height: 80,)
      ],
    );
  }
}
