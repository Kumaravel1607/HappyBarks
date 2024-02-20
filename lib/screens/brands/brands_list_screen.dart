import 'dart:convert';
import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/models/brands/brands_response.dart';
import 'package:happy_bark/screens/cart/cart_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/shimmer/brandPageShimmer.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:happy_bark/screens/products/product_list_screen.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class BrandsListPage extends StatefulWidget {
  const BrandsListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BrandsListPage> createState() => _BrandsListPageState();
}

class _BrandsListPageState extends State<BrandsListPage> {
  final _searchTextController = TextEditingController();
  ScrollController? _controller = ScrollController();

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
  int page = 1;
  List<BrandListData>? brandListData = [];
  bool stopPagination = false,
      callForPagination = true,
      firstTimeCallApi = true;
  bool _shouldDisplayLoader = false;
  final NetworkUtility _networkUtility = NetworkUtility();
  @override
  void initState() {
    _controller!.addListener(() {
      firstTimeCallApi = false;
      if (!stopPagination) {
        if (_controller!.position.pixels ==
            _controller!.position.maxScrollExtent) {
          log('At the bootm');
          log('Page : $page');
          callForPagination = true;

          page = page + 1;
          _fetchBrandsDataList();
        }
      }
    });
    _fetchBrandsDataList();
    Future.delayed(const Duration(milliseconds: 1000), () {
      page = page + 1;
      _fetchBrandsDataList();
    });
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<FutureDataProvider>(context, listen: false)
//           .getBrandsData(page);
//       Future.delayed(const Duration(milliseconds: 1000), () {
//         page = page + 1;
// // Here you can write your code
//         Provider.of<FutureDataProvider>(context, listen: false)
//             .getBrandsData(page);
//         // setState(() {
//         //   // Here you can write your code for open new view
//         // });
//       });
//     });
    super.initState();
  }

  Future _fetchBrandsDataList() async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }

    final value = await _networkUtility.makeWebServiceGetRequestForPagination(
      context: context,
      url: UrlConstant.brands + '?page=$page',
    );
    //  log("listFormSubmissionDataUrl : " + value);
    var response = BrandsResponse.fromJson(json.decode(value));

    if (response.status!) {
      if (mounted) {
        setState(() {
          callForPagination = false;
          if (response.responseData!.data!.isEmpty) {
            stopPagination = true;
          } else {
            response.responseData?.data?.forEach((element) {
              brandListData!.add(element);
            });
          }
        });
      }
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Consumer<FutureDataProvider>(builder: (context, dataProvider, child) {
        return Scaffold(
          //backgroundColor: Color.whiteA700,
          appBar: CustomAppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                width: 197,
                alignment: Alignment.centerLeft,
                child: const Text(
                  AppStrings.allBrands,
                  style: TextStyle(
                      color: CommonColor.greyBottomNavContentColorInactive,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ),
            ),
            isback: true,
            actions: [
              Icon(
                Icons.search,
                size: 20,
                color: CommonColor.greyBottomNavContentColorInactive,
              ),
              SizedBox(
                width: 13,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.home_outlined,
                  //  size: 20,
                  color: CommonColor.greyBottomNavContentColorInactive,
                ),
              ),
              SizedBox(
                width: 13,
              ),
              SizedBox(
                width: 40,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartPage(
                                fromBottomNav: false,
                              )),
                    );
                  },
                  child: Stack(
                    children: [
                      dataProvider.cartCount == 0
                          ? SizedBox()
                          : Positioned(
                              top: 5,
                              right: 2,
                              child: Container(
                                width: 20,
                                height: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: CommonColor.redColors),
                                child: Text(dataProvider.cartCount.toString()),
                              )),
                      Positioned(
                        bottom: 15,
                        left: 0,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 20,
                          color: CommonColor.greyBottomNavContentColorInactive,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
            controller: _searchTextController,
          ),
          body: (stopPagination && brandListData!.isEmpty)
              ? Center(
                  child: Text('Empty'),
                )
              : SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: [
                      if (brandListData!.isNotEmpty)
                        Container(
                          color: CommonColor.whiteColor,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, top: 22, right: 16, bottom: 70),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: brandListData!.length,
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
                                            brandId: brandListData![index]
                                                .id!
                                                .toString(),
                                            categoriesId: '',
                                            brandName:
                                                brandListData![index].name ??
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
                                                BorderRadius.circular(10.0),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: const BoxDecoration(
                                                color: CommonColor
                                                    .grayHomeGridViewBg,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: ExtendedImage.network(
                                                UrlConstant.baseUrlFile +
                                                    'uploads/brands/' +
                                                    brandListData![index].logo!,
                                                //"assets/images/farmina_logo.png",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextWidget(
                                              text: brandListData![index].name!,
                                              //exploreTextListGV![index],
                                              color: CommonColor
                                                  .greyAppBarTextColor,
                                              maxLine: 1,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                        ],
                                      ),
                                    );
                                  })),
                        ),
                      if (callForPagination) brandsShimmer()
                    ],
                  ),
                ),
        );
      }),
    );
  }
}
