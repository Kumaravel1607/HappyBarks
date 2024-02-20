import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/models/home/home_response.dart';
import 'package:happy_bark/screens/buy_pet/buy_pet_screen.dart';
import 'package:happy_bark/screens/products/product_detail_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/shimmer/homePageShimmer.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:happy_bark/screens/brands/brands_list_screen.dart';
import 'package:happy_bark/screens/products/product_list_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
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

  List<String>? exploreListGV = [
    "assets/images/farmina_logo.png",
    "assets/images/drools_logo.png",
    "assets/images/royal_canin_logo.png",
    "assets/images/jerhigh_logo.png",
    "assets/images/himalaya_logo.png",
    "assets/images/test_of_the_wild_logo.png",
    "assets/images/beaphar_logo.png",
    "assets/images/pedigree_logo.png",
    "assets/images/acana_logo.png",
  ];
  List<String>? exploreTextListGV = [
    AppStrings.farmina,
    AppStrings.drools,
    AppStrings.royalCanin,
    AppStrings.jerhigh,
    AppStrings.himalaya,
    AppStrings.tasteoftheWild,
    AppStrings.beaphar,
    AppStrings.pedigree,
    AppStrings.acana,
  ];

  List<String>? checkoutAccListGV = [
    "assets/images/home_ca1.png",
    "assets/images/home_ca2.png",
    "assets/images/home_ca3.png",
  ];
  List<String>? checkoutAccTextListGV = [
    AppStrings.varietyOfDogToys,
    AppStrings.collarsLeashesAndHarnesses,
    AppStrings.dogBowlsAndDiners,
  ];

  List<String>? comingSoonList = [
    "assets/images/grooming.png",
    "assets/images/walking.png",
    "assets/images/training.png",
  ];
  List<String>? comingSoonTextList = [
    AppStrings.grooming,
    AppStrings.walking,
    AppStrings.training,
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FutureDataProvider>(context, listen: false)
          .getHomeData(context);
      Provider.of<FutureDataProvider>(context, listen: false)
          .getCartCountData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
        Consumer<FutureDataProvider>(builder: (context, dataProvider, child) {
      return Scaffold(
        //backgroundColor: Color.whiteA700,
        appBar: CustomAppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              dataProvider.appBarTitle,
              style: TextStyle(
                  color: CommonColor.greyAppBarTextColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          isback: false,
          controller: _textController,
          onChanged: (value) {},
        ),
        body: FutureBuilder(
            future: dataProvider.homeData,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      bannerShimmer(),
                      categoriesShimmer(),
                      // sliderShimmer(context),
                      // topSellerShimmer(context, 8),
                      // topSellerShimmer(context, 8)
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Empty"),
                );
              } else if (snapshot.hasData) {
                final homeData = HomeResponse.fromJson(
                    json.decode(snapshot.data.toString()));

                return SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: CarouselSlider(
                        items: dataProvider.homeTopImageSliders,
                        options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 2.0,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                // _current = index;
                              });
                            }),
                      ),
                    ),
                    Container(
                      color: CommonColor.whiteColor,
                      width: SizeConfig.fullWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 8, bottom: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                                text: AppStrings.homeText1,
                                color: CommonColor.homeTextColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                            const TextWidget(
                                text: AppStrings.homeText2,
                                color: CommonColor.homeTextColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                            const SizedBox(
                              height: 12,
                            ),
                            GridView.builder(
                                shrinkWrap: true,
                                itemCount: imageListGV!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 1,
                                  height: 130.0, //48 dp of height
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BuyPetScreen(),
                                            ));
                                      } else if (index == 1) {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: ProductListPage(
                                            brandId: '',
                                            categoriesId: '',
                                            brandName: '',
                                          ),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      }
                                    },
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          imageListGV![index],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        TextWidget(
                                            text: textListGV![index],
                                            color:
                                                CommonColor.greyAppBarTextColor,
                                            maxLine: 1,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10),
                                      ],
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 28,
                            ),
                            const TextWidget(
                                text: AppStrings.greatPicks,
                                color: CommonColor.greyAppBarTextColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            const SizedBox(
                              height: 24,
                            ),
                            ListView.separated(
                                itemCount: 3,
                                // homeData.responseData!.products!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, ind) {
                                  return const SizedBox(
                                    height: 17,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      // PersistentNavBarNavigator.pushNewScreen(
                                      //   context,
                                      //   screen: ProductDetailPage(
                                      //     id: 6,
                                      //     // homeData.responseData!
                                      //     //     .products![index].id!
                                      //      productName:  "",
                                      //   ),
                                      //   withNavBar:
                                      //       false, // OPTIONAL VALUE. True by default.
                                      //   pageTransitionAnimation:
                                      //       PageTransitionAnimation.cupertino,
                                      // );
                                    },
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3.0,
                                              spreadRadius: 0.3,
                                              offset: Offset(
                                                5.0, // Move to right 7.0 horizontally
                                                5.0, // Move to bottom 8.0 Vertically
                                              ))
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15)),
                                              child:
                                                  // ExtendedImage.network(
                                                  //   UrlConstant.baseUrlFile +
                                                  //       'uploads/products/' +
                                                  //       homeData
                                                  //           .responseData!
                                                  //           .products![index]
                                                  //           .image!,
                                                  //   width: 137,
                                                  //   fit: BoxFit.fill,
                                                  //   cache: true,
                                                  // ),
                                                  Image.asset(
                                                "assets/images/img_pupporch.png",
                                                fit: BoxFit.fill,
                                                width: 137,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextWidget(
                                                      text:
                                                          // homeData
                                                          //     .responseData!
                                                          //     .products![index]
                                                          //     .name!,
                                                          AppStrings
                                                              .germanShepherdPuppy,
                                                      color: CommonColor
                                                          .greyAppBarTextColor,
                                                      maxLine: 2,
                                                      fontFamily:
                                                          AppStrings.poppins,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16),
                                                  TextWidget(
                                                      text:
                                                          //  homeData
                                                          //     .responseData!
                                                          //     .products![index]
                                                          //     .productType!,
                                                          AppStrings.twoMonths,
                                                      color: CommonColor
                                                          .greyAppBarTextColor,
                                                      maxLine: 2,
                                                      fontFamily:
                                                          AppStrings.poppins,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12),
                                                  const TextWidget(
                                                      text: AppStrings
                                                          .startingPrice,
                                                      color: CommonColor
                                                          .greyAppBarTextColor,
                                                      maxLine: 2,
                                                      fontFamily:
                                                          AppStrings.poppins,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 26,
                                                      width: 102,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: CommonColor
                                                            .darkYellowHome,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                      ),
                                                      child: const TextWidget(
                                                          text: AppStrings
                                                              .knowMoreC,
                                                          color: CommonColor
                                                              .whiteColor,
                                                          maxLine: 1,
                                                          fontFamily: AppStrings
                                                              .poppins,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                            const TextWidget(
                                text: AppStrings.exploreBrands,
                                color: CommonColor.greyAppBarTextColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            const SizedBox(
                              height: 10,
                            ),
                            GridView.builder(
                                shrinkWrap: true,
                                itemCount: homeData.responseData!.brands!
                                    .length, //exploreListGV!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 1,
                                  height: 130.0, //48 dp of height
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: ProductListPage(
                                          brandId: homeData
                                              .responseData!.brands![index].id
                                              .toString(),
                                          categoriesId: '',
                                          brandName: homeData.responseData!
                                                  .brands![index].name ??
                                              '',
                                        ),
                                        withNavBar:
                                            false, // OPTIONAL VALUE. True by default.
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.cupertino,
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            color:
                                                CommonColor.grayHomeGridViewBg,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: ExtendedImage.network(
                                            UrlConstant.baseUrlFile +
                                                'uploads/brands/' +
                                                homeData.responseData!
                                                    .brands![index].logo!,
                                            //"assets/images/farmina_logo.png",
                                            fit: BoxFit.fill,
                                          ),
                                          // Image.asset(
                                          //   exploreListGV![index],
                                          //   // fit: BoxFit.contain,
                                          // ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextWidget(
                                            text: homeData
                                                .responseData!
                                                .brands![index]
                                                .name!, //exploreTextListGV![index],
                                            color:
                                                CommonColor.greyAppBarTextColor,
                                            maxLine: 1,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10),
                                      ],
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 17,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BrandsListPage()),
                                  );
                                },
                                child: const TextWidget(
                                    text: AppStrings.exploreAll,
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w600,
                                    underline: TextDecoration.underline,
                                    fontSize: 10),
                              ),
                            ),
                            const SizedBox(
                              height: 33,
                            ),
                            const TextWidget(
                                text: AppStrings.checkoutAccesories,
                                color: CommonColor.greyAppBarTextColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: SizeConfig.fullWidth!,
                              height: 180,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      homeData.responseData!.categories!.length,
                                  //scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 1,
                                    height: 180.0, //48 dp of height
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: ProductListPage(
                                            brandId: '',
                                            categoriesId: homeData.responseData!
                                                .categories![index].id!
                                                .toString(),
                                            brandName: homeData.responseData!
                                                    .categories![index].name ??
                                                '',
                                          ),
                                          withNavBar:
                                              false, // OPTIONAL VALUE. True by default.
                                          pageTransitionAnimation:
                                              PageTransitionAnimation.cupertino,
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            child: ExtendedImage.network(
                                              UrlConstant.baseUrlFile +
                                                  'uploads/categories/' +
                                                  homeData
                                                      .responseData!
                                                      .categories![index]
                                                      .image!,
                                              width: 105,
                                              height: 150,
                                              fit: BoxFit.fill,
                                              cache: true,
                                            ),
                                            // Image.asset(
                                            //   checkoutAccListGV![index],
                                            //   fit: BoxFit.fill,
                                            //   width: 105,
                                            //   height: 150,
                                            // ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: SizedBox(
                                              width: 90,
                                              child: TextWidget(
                                                  text: homeData.responseData!
                                                      .categories![index].name!,
                                                  // checkoutAccTextListGV![
                                                  //     index],
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 2,
                                                  textAlign: TextAlign.center,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextWidget(
                                text: AppStrings.exploreAll,
                                color: CommonColor.greyAppBarTextColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth,
                              //  height: SizeConfig.fullHeight! * 0.42,
                              child: CarouselSlider(
                                items: dataProvider.homeBottomImageSliders,
                                // carouselController: _controller,
                                options: CarouselOptions(
                                    // height: SizeConfig.fullHeight! * 0.42,
                                    autoPlay: true,
                                    //enlargeCenterPage: true,
                                    aspectRatio: 2.0,
                                    viewportFraction: 1.0,
                                    enlargeCenterPage: false,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        // _current = index;
                                      });
                                    }),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextWidget(
                                text: AppStrings.comingSoon,
                                color: CommonColor.greyAppBarTextColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              height: 200,
                              width: double.infinity,
                              child: ListView.separated(
                                  itemCount: comingSoonList!.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, ind) {
                                    return const SizedBox(
                                      width: 17,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: Image.asset(
                                            comingSoonList![index],
                                            fit: BoxFit.fill,
                                            width: 150,
                                            height: 160,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: TextWidget(
                                              text: comingSoonTextList![index],
                                              color: CommonColor
                                                  .greyAppBarTextColor,
                                              maxLine: 1,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ));
              } else {
                return Center(
                  child: Text("Empty"),
                );
              }
            }),
      );
    }));
  }
}
