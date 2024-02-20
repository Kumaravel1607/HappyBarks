import 'package:flutter/material.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/text_widget.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final _searchTextController = TextEditingController();
  @override
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 36, bottom: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        text: AppStrings.aboutUs,
                        color: CommonColor.blueBottomNavContentColorActive,
                        maxLine: 1,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                    SizedBox(
                      height: 12,
                    ),
                    TextWidget(
                        text: AppStrings.aboutUsContent,
                        color: CommonColor.textColorBlack,
                        maxLine: 100,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w400,
                        fontSize: 10)
                  ],
                ),
              ),
            )));
  }
}
