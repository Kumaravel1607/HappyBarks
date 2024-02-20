import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/models/products/product_liat_response.dart';
import 'package:happy_bark/screens/cart/cart_screen.dart';
import 'package:happy_bark/screens/products/product_detail_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/shimmer/productPageShimmer.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/bottom_nav_bar.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  final String brandId;
  final String categoriesId;
  final String brandName;
  const ProductListPage(
      {Key? key,
      required this.brandId,
      required this.categoriesId,
      required this.brandName})
      : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final NetworkUtility _networkUtility = NetworkUtility();
  ScrollController? _controller = ScrollController();
  final _searchTextController = TextEditingController();
  int page = 1;
  List<ProductListData>? productListData = [];
  bool stopPagination = false,
      callForPagination = true,
      firstTimeCallApi = true;
  @override
  void initState() {
    _controller!.addListener(() {
      firstTimeCallApi = false;
      if (!stopPagination) {
        if (_controller!.position.pixels ==
            _controller!.position.maxScrollExtent) {
          callForPagination = true;

          page = page + 1;
          _fetchProductDataList();
        }
      }
    });
    _fetchProductDataList();
    super.initState();
  }

  Future _fetchProductDataList() async {
    final value = await _networkUtility.makeWebServiceGetRequestForPagination(
      context: context,
      url: widget.categoriesId.isNotEmpty
          ? UrlConstant.categoryWiseProduct +
              '/${widget.categoriesId}?page=$page'
          : widget.brandId.isEmpty
              ? UrlConstant.products + '?page=$page'
              : UrlConstant.brandwiseProduct + '/${widget.brandId}?page=$page',
    );
    //  log("listFormSubmissionDataUrl : " + value);
    var response = ProductListResponse.fromJson(json.decode(value));

    if (response.status!) {
      if (mounted) {
        setState(() {
          callForPagination = false;
          if (response.responseData!.data!.isEmpty) {
            stopPagination = true;
          } else {
            response.responseData?.data?.forEach((element) {
              productListData!.add(element);
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
    return Consumer<FutureDataProvider>(
        builder: (context, dataProvider, child) {
      return Scaffold(
        //backgroundColor: Color.whiteA700,
        appBar: CustomAppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Container(
              width: 197,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.brandName.isEmpty ? "Products" : widget.brandName,
                // AppStrings.dogFood,
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
              // size: 20,
              color: CommonColor.greyBottomNavContentColorInactive,
            ),
            SizedBox(
              width: 13,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const BottomNavBar()),
                    (route) => false);
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
        body: SafeArea(
            child: (stopPagination && productListData!.isEmpty)
                ? Center(
                    child: Text('Empty'),
                  )
                : SingleChildScrollView(
                    controller: _controller,
                    child: Container(
                      color: CommonColor.whiteColor,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, top: 22, right: 16, bottom: 70),
                          child: Column(
                            children: [
                              if (productListData!.isNotEmpty)
                                GridView.builder(
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(4),
                                    itemCount: productListData!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      height: 260.0, //48 dp of height
                                    ),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (productListData![index]
                                                        .status !=
                                                    null &&
                                                productListData![index]
                                                        .status! ==
                                                    1) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetailPage(
                                                          id: productListData![
                                                                  index]
                                                              .id!,
                                                          productName:
                                                              productListData![
                                                                          index]
                                                                      .name ??
                                                                  '',
                                                        )),
                                              );
                                            } else {
                                              Util.displayToast(
                                                  "Sorry this product is inactive!!!",
                                                  context);
                                            }
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 150,
                                                  height: 150,
                                                  alignment: Alignment.center,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color:
                                                        CommonColor.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                14)),
                                                    // boxShadow: [
                                                    //   BoxShadow(
                                                    //       color: Colors.grey,
                                                    //       blurRadius: 3.0,
                                                    //       spreadRadius: 0.3,
                                                    //       offset: Offset(
                                                    //         5.0, // Move to right 7.0 horizontally
                                                    //         5.0, // Move to bottom 8.0 Vertically
                                                    //       ))
                                                    // ],
                                                  ),
                                                  child: productListData![index]
                                                              .image !=
                                                          null
                                                      ? ExtendedImage.network(
                                                          UrlConstant
                                                                  .baseUrlFile +
                                                              'uploads/products/' +
                                                              productListData![
                                                                      index]
                                                                  .image!,
                                                          width: 150,
                                                          height: 150,
                                                          fit: BoxFit.fill,
                                                          cache: true,
                                                          //border: Border.all(color: Colors.red, width: 1.0),
                                                          // shape: boxShape,
                                                          // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                                          //cancelToken: cancellationToken,
                                                        )
                                                      : Text("No Image found")
                                                  // Image.network(
                                                  //   UrlConstant.baseUrlFile +
                                                  //       'uploads/products/' +
                                                  //       productListData![index]
                                                  //           .image!,
                                                  //   // 'assets/images/product_img1.png',
                                                  //   fit: BoxFit.fill,
                                                  //   width: 150,
                                                  //   height: 150,
                                                  // ),
                                                  ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              TextWidget(
                                                  text: productListData![index]
                                                          .name ??
                                                      '',
                                                  //AppStrings.productContent,
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 3,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 10),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              const TextWidget(
                                                  text: AppStrings.productName,
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 3,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              const TextWidget(
                                                  text: AppStrings.productPrice,
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 3,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10)
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              if (callForPagination) productsShimmer()
                            ],
                          )),
                    ),
                  )),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(color: CommonColor.textColorBlack),
          child: GestureDetector(
            onTap: () {
              openBottomSheetForSorting();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: [
                  Image.asset('assets/images/sorting_icon.png'),
                  const SizedBox(
                    width: 16,
                  ),
                  const TextWidget(
                      text: AppStrings.sort,
                      color: CommonColor.whiteColor,
                      maxLine: 1,
                      fontFamily: AppStrings.poppins,
                      fontWeight: FontWeight.w500,
                      fontSize: 14)
                ]),
                GestureDetector(
                  onTap: () {
                    openBottomSheetForFiltter();
                  },
                  child: Row(children: [
                    Image.asset('assets/images/filter_icon.png'),
                    const SizedBox(
                      width: 16,
                    ),
                    const TextWidget(
                        text: AppStrings.filter,
                        color: CommonColor.whiteColor,
                        maxLine: 1,
                        fontFamily: AppStrings.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 14)
                  ]),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<bool> openBottomSheetForSorting() async {
    String? _optionValRadio;
    return await showModalBottomSheet(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                    height: SizeConfig.fullHeight! * 0.5,
                    child: Scaffold(
                      backgroundColor: CommonColor.whiteColor,
                      body: Column(
                        children: [
                          Container(
                            height: 60,
                            color: CommonColor.lightGreyForFiltterappBar,
                            alignment: Alignment.center,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: TextWidget(
                                  text: AppStrings.sortByCap,
                                  color: CommonColor.greyAppBarTextColor,
                                  maxLine: 1,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: AppStrings.sortingList
                                    .map((t) => RadioListTile<String>(
                                          title: Text("${t}"),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor:
                                              CommonColor.textColorBlack,
                                          groupValue: (_optionValRadio == null)
                                              ? null
                                              : _optionValRadio,
                                          value: t,
                                          onChanged: (val) {
                                            setState(() {
                                              _optionValRadio = t;
                                            });
                                          },
                                        ))
                                    .toList(),
                              ),
                            ),
                          )
                        ],
                      ),
                      bottomNavigationBar: Container(
                        height: 72,
                        decoration: BoxDecoration(
                          color: CommonColor.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3.0,
                                spreadRadius: 0.3,
                                offset: Offset.fromDirection(1))
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: CommonColor.textColorBlack),
                                    borderRadius: BorderRadius.circular(30),
                                    color: CommonColor.grayHomeGridViewBg),
                                child: const TextWidget(
                                    text: AppStrings.closeCap,
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 150,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: CommonColor.textColorBlack),
                              child: const TextWidget(
                                  text: AppStrings.applyCap,
                                  color: CommonColor.whiteColor,
                                  maxLine: 1,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ));
              });
            }) ??
        false; //if showDialouge had returned null, then return false
  }

  Future<bool> openBottomSheetForFiltter() async {
    PageController _pageController = PageController();
    int _selectedIndex = 0;
    List<List<bool>> _isChecked = [[]];

    return await showModalBottomSheet(
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                    height: SizeConfig.fullHeight! * 0.9,
                    child: Scaffold(
                      backgroundColor: CommonColor.whiteColor,
                      body: Column(
                        children: [
                          Container(
                            height: 60,
                            color: CommonColor.lightGreyForFiltterappBar,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    TextWidget(
                                        text: AppStrings.filtersCap,
                                        color: CommonColor.greyAppBarTextColor,
                                        maxLine: 1,
                                        fontFamily: AppStrings.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                    TextWidget(
                                        text: AppStrings.clearAll,
                                        color: CommonColor
                                            .blueBottomNavContentColorActive,
                                        maxLine: 1,
                                        fontFamily: AppStrings.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12)
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ListView.builder(
                                      itemCount: AppStrings.filtersList.length,
                                      itemBuilder: (context, index) {
                                        _isChecked.add([]);
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _selectedIndex = index;
                                              _pageController.jumpToPage(index);
                                            });
                                          },
                                          child: Container(
                                            height: 50,
                                            alignment: Alignment.center,
                                            color: _selectedIndex == index
                                                ? CommonColor.whiteColor
                                                : CommonColor
                                                    .grayHomeGridViewBg,
                                            child: TextWidget(
                                                text: AppStrings
                                                    .filtersList[index],
                                                color: CommonColor
                                                    .greyAppBarTextColor,
                                                maxLine: 1,
                                                fontFamily: AppStrings.poppins,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        );
                                      }),
                                ),
                                Expanded(
                                    flex: 6,
                                    child: PageView(
                                        controller: _pageController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: List.generate(
                                          AppStrings.filtersList.length,
                                          (index) => Container(
                                            height: SizeConfig.fullHeight,
                                            // color: CommonColor.redColors,
                                            child: ListView.builder(
                                                itemCount: AppStrings
                                                    .filtersItemsList[
                                                        _selectedIndex]
                                                    .length,
                                                itemBuilder: (context, ind) {
                                                  _isChecked[index].add(false);
                                                  return CheckboxListTile(
                                                      title: TextWidget(
                                                          text: AppStrings
                                                                  .filtersItemsList[
                                                              index][ind],
                                                          color: CommonColor
                                                              .greyAppBarTextColor,
                                                          maxLine: 1,
                                                          fontFamily:
                                                              AppStrings
                                                                  .poppins,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12),
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                      value: _isChecked[index]
                                                          [ind],
                                                      onChanged: (val) {
                                                        setState(
                                                          () {
                                                            _isChecked[index]
                                                                [ind] = val!;
                                                          },
                                                        );
                                                      });
                                                }),
                                          ),
                                        )))
                              ],
                            ),
                          )
                        ],
                      ),
                      bottomNavigationBar: Container(
                        height: 72,
                        decoration: BoxDecoration(
                          color: CommonColor.whiteColor,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3.0,
                                spreadRadius: 0.3,
                                offset: Offset.fromDirection(1))
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: CommonColor.textColorBlack),
                                    borderRadius: BorderRadius.circular(30),
                                    color: CommonColor.grayHomeGridViewBg),
                                child: const TextWidget(
                                    text: AppStrings.closeCap,
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 150,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: CommonColor.textColorBlack),
                              child: const TextWidget(
                                  text: AppStrings.applyCap,
                                  color: CommonColor.whiteColor,
                                  maxLine: 1,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ));
              });
            }) ??
        false; //if showDialouge had returned null, then return false
  }
}
