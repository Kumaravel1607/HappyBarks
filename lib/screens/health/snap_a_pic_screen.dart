import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happy_bark/screens/health/breed_and_age_screen.dart';
import 'package:happy_bark/screens/health/pet_profile_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:image_picker/image_picker.dart';

class SnapAPicScreen extends StatefulWidget {
  const SnapAPicScreen({Key? key}) : super(key: key);

  @override
  State<SnapAPicScreen> createState() => _SnapAPicScreenState();
}

class _SnapAPicScreenState extends State<SnapAPicScreen> {
  File? _image;

  final _picker = ImagePicker();
  bool isSelected = false;
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        isSelected = true;
      });
    }
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
                        builder: (context) => BreedAndAgeScreen()));
              },
            )),
        // automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black45),

        backgroundColor: Colors.white60,
        elevation: 0,
        title: Text(
          "Snap A Pic",
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
              height: 20,
            ),
            Text(
              "One last thing",
              style: TextStyle(
                  color: CommonColor.textColorBlack,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            Text(
              "Say Cheese!",
              style: TextStyle(
                  color: CommonColor.blueBottomNavContentColorActive,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            _buildPhotoContainer(),
            SizedBox(
              height: 20,
            ),
            _buildFinishButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoContainer() {
    return Card(
      elevation: 4,
      child: Container(
        height: 354,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: !isSelected,
              replacement: GestureDetector(
                onTap: () {
                  _openImagePicker();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 17, right: 17, top: 18),
                  height: 262,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      image: _image != null
                          ? DecorationImage(
                              image: FileImage(_image!), fit: BoxFit.cover)
                          : null),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 17, right: 17, top: 18),
                height: 262,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black38,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _openImagePicker();
                          },
                          child: Text(
                            "Snap A Pic",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                              onSurface:
                                  CommonColor.blueBottomNavContentColorActive,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      _image != null
                          ? Image.file(_image!, fit: BoxFit.fill)
                          : const Text('Please select an image')
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 17, right: 17, top: 20),
              child: Text(
                "“pet’s name’ 2, May 2023",
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

  Widget _buildFinishButton() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PetProfileScreen()));
          },
          child: Container(
            height: 47,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade400),
            child: Center(
              child: Text(
                "Finish",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppStrings.poppins,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Remind me later",
            style: TextStyle(
                color: CommonColor.textColorBlack,
                fontFamily: AppStrings.poppins,
                fontWeight: FontWeight.w500,
                fontSize: 12))
      ],
    );
  }
}
