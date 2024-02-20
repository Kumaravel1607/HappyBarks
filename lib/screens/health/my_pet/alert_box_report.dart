import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:image_picker/image_picker.dart';

import 'my_pet_screen.dart';

class AlertBoxReport extends StatefulWidget {
  AlertBoxReport({Key? key}) : super(key: key);

  @override
  State<AlertBoxReport> createState() => _AlertBoxReport();

}

class _AlertBoxReport extends State<AlertBoxReport> {

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
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      title: Column(
        children: [
          Text("Add Report",
              style: TextStyle(
                  color: CommonColor.textColorBlack,
                  fontFamily: AppStrings.poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.black45)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 10),
                        child: Text(
                          "${selectedDate.toLocal()}"
                              .split(' ')[0],
                          style: const TextStyle(fontFamily: AppStrings.poppins,fontSize: 14,fontWeight: FontWeight.w500,
                              color: CommonColor
                                  .textColorBlack),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.calendar_month,
                        color: CommonColor.blackColor,
                      ),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),

      Card(
        elevation: 4,
        child: Container(
          height: 138,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(5)),
         
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !isSelected,
                replacement: GestureDetector(
                  onTap: () {
                    _openImagePicker();
                  },
                  child: Container(
                    // margin: EdgeInsets.only(left: 17, right: 17, top: 18),
                    height: 135,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        image: _image != null
                            ? DecorationImage(
                            image: FileImage(_image!), fit: BoxFit.cover)
                            : null),
                  ),
                ),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_upload_outlined,size: 50,
                          color: Colors.black38,
                        ),
                        TextButton(
                            onPressed: () {
                              _openImagePicker();
                            },
                            child: Text(
                              "Upload a Report",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10),
                            ),
                            style: ElevatedButton.styleFrom(
                                onSurface:
                                Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))
                                  )
                                    ),
                        _image != null
                            ? Image.file(_image!, fit: BoxFit.fill)
                            : const Text('')
                            // : const Text('Please select an image')
                      ]),
                ),
              ),

            ],
          ),
        ),
      ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();

            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(10),
                  color: CommonColor
                      .blueBottomNavContentColorActive),
              child: Center(
                child: Text("ADD",
                    style: TextStyle(
                        color: CommonColor.whiteColor,
                        fontFamily:
                        AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
