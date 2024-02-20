import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';



import '../screens/health/snap_a_pic_screen.dart';

class PetController extends GetxController {


  RxString rxPetType="".obs;
  RxString rxGender="".obs;
  TextEditingController petNameController=TextEditingController();

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController searchBreedNameController=TextEditingController();

  TextEditingController typeController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController aboutController=TextEditingController();
  TextEditingController breedController=TextEditingController();
  TextEditingController dobController=TextEditingController();



  addPet(String type,String gender,String name,String about,String breed,String dob) async {
    var request = {
      "type": type,
      "gender": gender,
      "name": name,
      "about": about,
      "breed": breed,
      "dob": dob,
    };
  }
}
