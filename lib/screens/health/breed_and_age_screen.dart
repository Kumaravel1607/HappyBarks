import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:happy_bark/controller/pet_controller.dart';
import 'package:happy_bark/screens/health/add_new_pet_screen.dart';
import 'package:happy_bark/screens/health/snap_a_pic_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:intl/intl.dart';

class BreedAndAgeScreen extends StatefulWidget {
  const BreedAndAgeScreen({Key? key}) : super(key: key);

  @override
  State<BreedAndAgeScreen> createState() => _BreedAndAgeScreenState();
}

class _BreedAndAgeScreenState extends State<BreedAndAgeScreen> {
  PetController authController = Get.put(PetController());
  final _formKey = GlobalKey<FormState>();
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

  List<String> suggestionList = [
    "Indie Dog",
    "German Shepherd",
    "Pug",
    "Beagle",
    "Golden Retriver",
    "Labrador"
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNewPetScreen()));
              },
            )),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "Breed & Age",
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
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Breed & Age",
                style: TextStyle(
                    color: CommonColor.blueBottomNavContentColorActive,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Select “pet’s name’ Breed",
                style: TextStyle(
                    color: CommonColor.primaryColorCabBook,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                height: 14,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Please Select Pet's name";
                    }
                    return null;
                  },
                  controller: authController.searchBreedNameController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      fillColor: Color(0xffE9F2F2),
                      filled: true,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(18),
                      // border: InputBorder.none,
                      hintText: 'Search Breed',
                      hintStyle: TextStyle(
                          color: CommonColor.greyBottomNavContentColorInactive,
                          fontFamily: AppStrings.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                ),
              ),
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
              Wrap(
                children: List.generate(
                    suggestionList.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 5, bottom: 5),
                          child: GestureDetector(
                              onTap: () {
                                print("vgvnvjnhvj");
                                Fluttertoast.showToast(msg: "press......");
                                authController.searchBreedNameController.text =
                                    suggestionList[index];
                              },
                              child: _buildSuggestion(suggestionList[index])),
                        )),
              ),
              _buildDOB(),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>SnapAPicScreen() ));
            // if (_formKey.currentState!.validate()) {
            //   authController.addPet(
            //       authController.rxPetType.value,
            //       authController.rxGender.value,
            //       authController.petNameController.text,
            //       "about",
            //       authController.searchBreedNameController.text,
            //       DateFormat("dd/MM/yyyy").format(selectedDate));
            // }
          },
          backgroundColor: CommonColor.blueBottomNavContentColorActive,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestion(String title) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300),
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

  Widget _buildDOB() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("“pet’s name’ Birthday",
            style: TextStyle(
                color: CommonColor.primaryColorCabBook,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        SizedBox(
          height: 15,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade400,
                        )),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.calendar_month,
                            color:
                                CommonColor.greyBottomNavContentColorInactive,
                          ),
                          onPressed: () {
                            authController.dobController;
                            _selectDate(context);
                          },
                        ),
                      ],
                    )),
              )
            ])
      ],
    );
  }
}
