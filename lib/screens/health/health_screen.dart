import 'package:flutter/material.dart';
import 'package:happy_bark/screens/health/add_new_pet_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  final _searchTextController = TextEditingController();

  // @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //backgroundColor: Color.whiteA700,
            appBar: CustomAppBar(
              title: const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  AppStrings.appBarDemoTitle,
                  style: TextStyle(
                      color: CommonColor.greyAppBarTextColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
              isback: false,
              controller: _searchTextController,
            ),
            body: Center(
              child: TextButton(onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(  builder: (context) =>AddNewPetScreen ()));
              },
              child: Text("Health Screen")),
            )));
  }
}
