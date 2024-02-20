import 'package:flutter/material.dart';
import 'package:happy_bark/screens/products/product_detail_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/text_widget.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final _searchTextController = TextEditingController();
  List<String>? imageListGV = [
    "assets/images/home_gv_icon1.png",
    "assets/images/home_gv_icon2.png",
    "assets/images/home_gv_icon3.png",
    "assets/images/home_gv_icon4.png",
    "assets/images/home_gv_icon5.png",
    "assets/images/home_gv_icon6.png",
  ];
  List<String>? textListGV = [
    AppStrings.buyPets,
    AppStrings.petFood,
    AppStrings.treatAndAccesories,
    AppStrings.petMedicines,
    AppStrings.vet,
    AppStrings.health,
  ];
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: CommonColor.whiteColor,
          appBar: CustomAppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(
                width: 197,
                alignment: Alignment.centerLeft,
                child: const Text(
                  AppStrings.services,
                  style: TextStyle(
                      color: CommonColor.greyBottomNavContentColorInactive,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ),
            isback: false,
            actions: const [
              Icon(
                Icons.search,
                // size: 20,
                color: CommonColor.greyBottomNavContentColorInactive,
              ),
              SizedBox(
                width: 13,
              ),
              Icon(
                Icons.home_outlined,
                //  size: 20,
                color: CommonColor.greyBottomNavContentColorInactive,
              ),
              SizedBox(
                width: 13,
              ),
              Icon(
                Icons.badge,
                //  size: 20,
                color: CommonColor.greyBottomNavContentColorInactive,
              ),
              SizedBox(
                width: 16,
              )
            ],
            controller: _searchTextController,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                      text: AppStrings.services,
                      color: CommonColor.blueBottomNavContentColorActive,
                      maxLine: 1,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                  SizedBox(
                    height: 18,
                  ),
                  GridView.builder                    (
                      shrinkWrap: true,
                      itemCount: imageListGV!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 1,
                        height: 180.0, //48 dp of height
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(
                              imageListGV![index],
                              width: 150,
                              height: 150,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            TextWidget(
                                text: textListGV![index],
                                color: CommonColor.greyAppBarTextColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: 10),
                          ],
                        );
                      }),
                  SizedBox(height: 70)
                ],
              ),
            ),
          )),
    );
  }
}
