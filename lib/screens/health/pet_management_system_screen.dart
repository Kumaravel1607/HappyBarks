import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:happy_bark/controller/pet_controller.dart';
import 'package:happy_bark/screens/health/add_new_pet_screen.dart';
import 'package:happy_bark/screens/home/home_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

class PetManagementSystemScreen extends StatelessWidget {
   PetManagementSystemScreen({Key? key}) : super(key: key);

   TextEditingController typeController=TextEditingController();
   TextEditingController genderController=TextEditingController();
   TextEditingController nameController=TextEditingController();
   TextEditingController aboutController=TextEditingController();
   TextEditingController breedController=TextEditingController();
   TextEditingController dobController=TextEditingController();

   PetController authController=Get.put(PetController());
   final _formKey=GlobalKey<FormState>();

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
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            )),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "Pet Management System",
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
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "YOUR PERSONAL PET MANAGEMENT SYSTEM",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: CommonColor.blueBottomNavContentColorActive,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPetManagementSystem(
                    "A lifetime Free Service to manage your Pet’s health better"),
                _buildPetManagementSystem("Manage all in one place"),
                _buildPetManagementSystem(
                    "Set reminders & notification for all your pet needs"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Image(image: AssetImage("assets/images/arrow_image.png")),
            Container(
              width: double.infinity,
              height: 145,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSuggestion("Vaccination"),
                      SizedBox(
                        width: 5,
                      ),
                      _buildSuggestion("Deworming"),
                      SizedBox(
                        width: 5,
                      ),
                      _buildSuggestion("Medication Reminder"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildSuggestion("Meal Plans"),
                      SizedBox(
                        width: 5,
                      ),
                      _buildSuggestion("Prescription"),
                      SizedBox(
                        width: 5,
                      ),
                      _buildSuggestion("Training Reminder"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildSuggestion("Consult Our Vet"),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Image(image: AssetImage("assets/images/Add_pet_image.png")),
            SizedBox(
              height: 8,
            ),
            _buildAddPetButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPetManagementSystem(String title) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 103,
      width: 103,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CommonColor.blueBottomNavContentColorActive),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: CommonColor.whiteColor,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w600,
              fontSize: 10),
        ),
      ),
    );
  }

  Widget _buildSuggestion(String title) {
    return Container(
      // height: 47,
      // width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        child: Text(title,
            style: TextStyle(
                color: CommonColor.primaryColorCabBook,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w400,
                fontSize: 10)),
      ),
    );
  }

  Widget _buildAddPetButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddNewPetScreen()));
      },
      child: Container(
        height: 46,
        width: 210,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: CommonColor.darkYellowHome),
        child: Center(
          child: Text("ADD PET",
              style: TextStyle(
                  color: CommonColor.whiteColor,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
        ),
      ),
    );
  }
}
