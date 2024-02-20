import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:happy_bark/controller/pet_controller.dart';
import 'package:happy_bark/screens/health/breed_and_age_screen.dart';
import 'package:happy_bark/screens/health/health_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';

class AddNewPetScreen extends StatefulWidget {
  AddNewPetScreen({Key? key}) : super(key: key);

  @override
  State<AddNewPetScreen> createState() => _AddNewPetScreenState();
}

class _AddNewPetScreenState extends State<AddNewPetScreen> {
  bool isCheckedMale = false;
  bool isCheckedFemale = false;

  final _formKey = GlobalKey<FormState>();

  PetController authController = Get.put(PetController());

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return CommonColor.blueBottomNavContentColorActive;
  }

  @override

  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black45),
          leading: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HealthPage()));
                },
              )),
          // automaticallyImplyLeading: true,
          backgroundColor: Colors.white60,
          elevation: 0,
          title: Text(
            "Add New Pet",
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: FloatingActionButton(
            onPressed: () {
              if (authController.rxPetType.value.isEmpty) {
                Fluttertoast.showToast(msg: "Please Select Pet Type");
                return;
              }

              if (_formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BreedAndAgeScreen()));
              }
            },
            backgroundColor: CommonColor.blueBottomNavContentColorActive,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Basic Details",
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
                "Types of Pet",
                style: TextStyle(
                    color: CommonColor.primaryColorCabBook,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => _buildTypeOfPetContainer(
                          "Dog",
                          "assets/images/beagle_dog_image.png",
                          authController.rxPetType.value.isEmpty
                              ? false
                              : authController.rxPetType.value == "Dog"
                                  ? true
                                  : false),
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(
                      child: Obx(
                    () => _buildTypeOfPetContainer(
                        "Cat",
                        "assets/images/cat_image.png",
                        authController.rxPetType.value.isEmpty
                            ? false
                            : authController.rxPetType.value == "Cat"
                                ? true
                                : false),
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              _buildGender(),
              SizedBox(
                height: 20,
              ),
              _buildPetsName(),
            ]),
          ),
        ));
  }

  Widget _buildTypeOfPetContainer(String title, String image, bool isSelected) {
    return InkWell(
      onTap: () {
        authController.rxPetType.value = title;
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? CommonColor.blueBottomNavContentColorActive
                  : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                    color: CommonColor.blueBottomNavContentColorActive,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image(
                  image: AssetImage(image),
                  height: 95,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
              color: CommonColor.primaryColorCabBook,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isCheckedMale,
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedFemale = false;
                          isCheckedMale = value!;
                          authController.rxGender.value = "Male";
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Male",
                        style: TextStyle(
                            color: CommonColor.primaryColorCabBook,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(Icons.male),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade300),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isCheckedFemale,
                      onChanged: (bool? value) {
                        setState(() {
                          authController.rxGender.value = "Female";
                          isCheckedMale = false;
                          isCheckedFemale = value!;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Female",
                        style: TextStyle(
                            color: CommonColor.primaryColorCabBook,
                            fontFamily: AppStrings.poppins,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(Icons.female),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildPetsName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pet’s Name",
          style: TextStyle(
              color: CommonColor.primaryColorCabBook,
              fontFamily: AppStrings.poppins,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
        SizedBox(
          height: 10,
        ),
        Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value.toString().isEmpty) {
                return 'Please Write Pet name';
              }
              return null;
            },
            controller: authController.petNameController,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              fillColor: Color(0xffE9F2F2),
              filled: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(18),
              hintText: 'Write Pet’s Name',
              hintStyle: TextStyle(
                  color: CommonColor.greyBottomNavContentColorInactive,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

}
