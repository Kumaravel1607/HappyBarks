import 'dart:convert';
import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:happy_bark/models/products/pincode_check_response.dart';
import 'package:happy_bark/models/products/product_detail_response.dart';
import 'package:happy_bark/screens/cart/cart_screen.dart';
import 'package:happy_bark/screens/login/login_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/shimmer/productDetailPageShimmer.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/bottom_nav_bar.dart';
import 'package:happy_bark/widgets/text_form_field.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final productName;
  const ProductDetailPage(
      {Key? key, required this.id, required this.productName})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final NetworkUtility _networkUtility = NetworkUtility();
  bool _shouldDisplayLoader = false;
  ScrollController _scrollController = ScrollController();
  final _searchTextController = TextEditingController();
  final _pinTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _messageTextController = TextEditingController();
  int _selectedSize = 0, cartCount = 0, varientId = 0, _imagesIndex = 0;
  String? productId = '';
  bool returnExchangePolicyExpand = true;
  int _selectedIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FutureDataProvider>(context, listen: false)
          .getProductDetailData(context, widget.id);
    });

    super.initState();
  }

  Future _pincodeCheck(String id) async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    Map<String, dynamic> body = {
      "product_id": id,
      "pincode": _pinTextController.text
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        context: context,
        url: UrlConstant.pincodeCheck,
        header: header,
        body: jsonEncode(body));
    //  log("listFormSubmissionDataUrl : " + value);
    var response = PincodeCheckResponse.fromJson(json.decode(value));
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = false;
      });
    }
    if (response.status!) {
      if (mounted) {
        //setState(() {});
        Util.displayToast(
            response.responseMessage ?? AppStrings.somethingWentWrong, context);
      }
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
    }
  }

  Future _enquiry(String id) async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    Map<String, dynamic> body = {
      "product_id": id,
      "name": _nameTextController.text,
      "email": _emailTextController.text,
      "phone": _phoneTextController.text,
      "message": _messageTextController.text,
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        context: context,
        url: UrlConstant.enquiry,
        header: header,
        body: jsonEncode(body));
    //  log("listFormSubmissionDataUrl : " + value);
    var response = PincodeCheckResponse.fromJson(json.decode(value));
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = false;
      });
    }
    if (response.status!) {
      if (mounted) {
        //setState(() {});
        Util.displayToast(
            response.responseMessage ?? AppStrings.somethingWentWrong, context);
      }
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
    }
  }

  Future<bool> _addCart(String id, String varId) async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    Map<String, dynamic> body = {
      "product_id": widget.id,
      "varient_id": varientId,
      "quantity": cartCount,
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    log("body : " + jsonEncode(body));
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        context: context,
        url: UrlConstant.addCartUrl,
        header: header,
        body: jsonEncode(body));

    var response = PincodeCheckResponse.fromJson(json.decode(value));

    if (response.status!) {
      if (mounted) {
        setState(() {});
        _shouldDisplayLoader = false;

        Util.displayToast(
            response.responseMessage ?? AppStrings.somethingWentWrong, context);
      }
      return true;
    } else {
      if (mounted) {
        setState(() {
          _shouldDisplayLoader = false;
        });
      }
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
      return false;
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
                //AppStrings.royalCanin,
                widget.productName,
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
          child: FutureBuilder(
              future: dataProvider.productDetailData,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [productDetailShimmer()],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Empty"),
                  );
                } else if (snapshot.hasData) {
                  final productDetailData = ProductDetailResponse.fromJson(
                      json.decode(snapshot.data.toString()));
                  // String breedSizeString = '';
                  // List<String> breedSize = [];
                  // if (productDetailData.responseData?[0].breedSize != null) {
                  //   breedSizeString =
                  //       productDetailData.responseData![0].breedSize!.substring(
                  //           0,
                  //           productDetailData
                  //               .responseData![0].breedSize!.length);
                  //   breedSize = breedSizeString.split(",");
                  // }
                  if (productDetailData.responseData?.products != null) {
                    productId =
                        productDetailData.responseData?.products!.id.toString();
                  }
                  if (productDetailData.responseData!.variations!.isNotEmpty) {
                    varientId = productDetailData
                            .responseData!.variations![_selectedSize].id ??
                        0;
                  }
                  // print(breedSize);
                  return productDetailData.responseData?.products == null
                      ? Center(
                          child: Text("Sorry no product found"),
                        )
                      : ModalProgressHUD(
                          inAsyncCall: _shouldDisplayLoader,
                          progressIndicator: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: CommonColor
                                .blueBottomNavContentColorActive, //<-- SEE HERE
                            backgroundColor: CommonColor
                                .greyBottomNavContentColorInactive, //<-- SEE HERE
                          ),
                          child: Scaffold(
                            body: SingleChildScrollView(
                              controller: _scrollController,
                              child: Container(
                                color: CommonColor.whiteColor,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 17,
                                        right: 20,
                                        bottom: 70),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: SizeConfig.fullWidth,
                                          height: 280,
                                          decoration: const BoxDecoration(
                                            color: CommonColor.whiteColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(14)),
                                          ),
                                          child: (productDetailData
                                                          .responseData!
                                                          .images !=
                                                      null &&
                                                  productDetailData
                                                      .responseData!
                                                      .images!
                                                      .isNotEmpty)
                                              ? ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ExtendedImage.network(
                                                    UrlConstant.baseUrlFile +
                                                        'uploads/products/' +
                                                        productDetailData
                                                            .responseData!
                                                            .images![
                                                                _imagesIndex]
                                                            .images!,
                                                    fit: BoxFit.fill,
                                                    cache: true,
                                                  )
                                                  // Image.asset(
                                                  //   "assets/images/product_img1.png",
                                                  //   fit: BoxFit.fill,
                                                  //   //width: 137,
                                                  // ),
                                                  )
                                              : ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(15)),
                                                  child: ExtendedImage.network(
                                                    UrlConstant.baseUrlFile +
                                                        'uploads/products/' +
                                                        productDetailData
                                                            .responseData!
                                                            .products!
                                                            .image!,
                                                    fit: BoxFit.fill,
                                                    cache: true,
                                                  )
                                                  // Image.asset(
                                                  //   "assets/images/product_img1.png",
                                                  //   fit: BoxFit.fill,
                                                  //   //width: 137,
                                                  // ),
                                                  ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        if (productDetailData
                                                    .responseData!.images !=
                                                null ||
                                            productDetailData.responseData!
                                                .images!.isNotEmpty)
                                          SizedBox(
                                            width: double.infinity,
                                            height: 75,
                                            child: ListView.separated(
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, indeex) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _imagesIndex = indeex;
                                                      });
                                                    },
                                                    child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    15)),
                                                        child: ExtendedImage
                                                            .network(
                                                          UrlConstant
                                                                  .baseUrlFile +
                                                              'uploads/products/' +
                                                              productDetailData
                                                                  .responseData!
                                                                  .images![
                                                                      indeex]
                                                                  .images!,
                                                          fit: BoxFit.fill,
                                                          cache: true,
                                                        )
                                                        // Image.asset(
                                                        //   "assets/images/product_img1.png",
                                                        //   fit: BoxFit.fill,
                                                        //   width: 74,
                                                        //   height: 74,
                                                        // ),
                                                        ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, ind) {
                                                  return const SizedBox(
                                                    width: 8,
                                                  );
                                                },
                                                itemCount: productDetailData
                                                    .responseData!
                                                    .images!
                                                    .length),
                                          ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextWidget(
                                            text: productDetailData
                                                    .responseData!
                                                    .products!
                                                    .productName ??
                                                '',
                                            // AppStrings.productContent,
                                            color:
                                                CommonColor.greyAppBarTextColor,
                                            maxLine: 3,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        TextWidget(
                                            text: productDetailData
                                                    .responseData!
                                                    .products!
                                                    .brandName ??
                                                '', //AppStrings.productName,
                                            color:
                                                CommonColor.greyAppBarTextColor,
                                            maxLine: 3,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                        // const SizedBox(
                                        //   height: 9,
                                        // ),
                                        // RatingBar.builder(
                                        //   initialRating: 3,
                                        //   itemSize: 20,
                                        //   minRating: 1,
                                        //   direction: Axis.horizontal,
                                        //   allowHalfRating: true,
                                        //   itemCount: 5,
                                        //   itemPadding:
                                        //       const EdgeInsets.symmetric(horizontal: 1.0),
                                        //   itemBuilder: (context, _) => const Icon(
                                        //     Icons.star,
                                        //     color: Colors.amber,
                                        //   ),
                                        //   onRatingUpdate: (rating) {
                                        //     print(rating);
                                        //   },
                                        // ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const TextWidget(
                                            text: AppStrings.size,
                                            color:
                                                CommonColor.greyAppBarTextColor,
                                            maxLine: 3,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 75,
                                          child: ListView.separated(
                                            itemCount: productDetailData
                                                .responseData!
                                                .variations!
                                                .length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _selectedSize = index;
                                                  });
                                                },
                                                child: Container(
                                                  width: 75,
                                                  height: 75,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: _selectedSize ==
                                                            index
                                                        ? CommonColor
                                                            .blueBottomNavContentColorActive
                                                        : CommonColor
                                                            .whiteColor,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: CommonColor
                                                            .greyBottomNavContentColorInactive),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                14)),
                                                  ),
                                                  child: TextWidget(
                                                      text: productDetailData
                                                              .responseData!
                                                              .variations![
                                                                  index]
                                                              .size ??
                                                          '',
                                                      color: _selectedSize ==
                                                              index
                                                          ? CommonColor
                                                              .whiteColor
                                                          : CommonColor
                                                              .greyAppBarTextColor,
                                                      maxLine: 3,
                                                      fontFamily:
                                                          AppStrings.poppins,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ),
                                              );
                                            },
                                            separatorBuilder: (context, ind) {
                                              return const SizedBox(
                                                width: 8,
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        const TextWidget(
                                            text: AppStrings.price,
                                            color:
                                                CommonColor.greyAppBarTextColor,
                                            maxLine: 3,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        if (productDetailData.responseData!
                                            .variations!.isNotEmpty)
                                          Row(
                                            children: [
                                              TextWidget(
                                                text: "₹ " +
                                                    (productDetailData
                                                            .responseData
                                                            ?.variations?[
                                                                _selectedSize]
                                                            .price ??
                                                        ''),
                                                color: CommonColor
                                                    .greyAppBarTextColor,
                                                maxLine: 3,
                                                fontFamily: AppStrings.poppins,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                underline:
                                                    TextDecoration.lineThrough,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              TextWidget(
                                                  text: "₹ " +
                                                      (productDetailData
                                                              .responseData!
                                                              .variations![
                                                                  _selectedSize]
                                                              .disPrice ??
                                                          ''),
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 3,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              // TextWidget(
                                              //     text: AppStrings.discountOffer,
                                              //     color: CommonColor
                                              //         .blueBottomNavContentColorActive,
                                              //     maxLine: 3,
                                              //     fontFamily: AppStrings.poppins,
                                              //     fontWeight: FontWeight.w500,
                                              //     fontSize: 14),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormFieldWidget(
                                          controller: _pinTextController,
                                          height: 56,
                                          hintText: AppStrings.enterYourPincode,
                                          readOnly: false,
                                          maxLine: 1,
                                          keyType: TextInputType.number,
                                          wordLimit: 6,
                                          onChanged: (value) {},
                                          suffixIcon: const TextWidget(
                                              text: AppStrings.check,
                                              color: CommonColor
                                                  .greyAppBarTextColor,
                                              maxLine: 1,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                          onSuffixTap: () {
                                            _pincodeCheck(productDetailData
                                                .responseData!.products!.id!
                                                .toString());
                                          },
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Container(
                                            color:
                                                CommonColor.lightGreyForTabBar,
                                            height: 50,
                                            width: SizeConfig.fullWidth,
                                            child: ListView.separated(
                                              itemCount: AppStrings
                                                  .detailPageTab.length,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox(
                                                  width: 1,
                                                );
                                              },
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, right: 8),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedIndex = index;
                                                      });
                                                    },
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: TextWidget(
                                                                text: AppStrings
                                                                        .detailPageTab[
                                                                    index],
                                                                color: CommonColor
                                                                    .greyAppBarTextColor,
                                                                maxLine: 1,
                                                                fontFamily:
                                                                    AppStrings
                                                                        .poppins,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 2,
                                                          width: SizeConfig
                                                                  .fullWidth! *
                                                              0.197,
                                                          color: _selectedIndex ==
                                                                  index
                                                              ? CommonColor
                                                                  .blueBottomNavContentColorActive
                                                              : CommonColor
                                                                  .lightGreyForTabBar,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            )),
                                        const SizedBox(
                                          height: 32,
                                        ),
                                        _selectedIndex == 0
                                            ? Html(
                                                data: productDetailData
                                                    .responseData!
                                                    .products!
                                                    .description!)
                                            : _selectedIndex == 2
                                                ? Html(
                                                    data: productDetailData
                                                        .responseData!
                                                        .products!
                                                        .manufactureProduct!)
                                                : TextWidget(
                                                    text:
                                                        //AppStrings
                                                        //  .manufacturerDetailsContent,
                                                        //  AppStrings.manufacturerDetailsContent,
                                                        "",
                                                    color: CommonColor
                                                        .greyAppBarTextColor,
                                                    // maxLine: 100,
                                                    fontFamily:
                                                        AppStrings.poppins,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10),
                                        const SizedBox(
                                          height: 13,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                                text: AppStrings
                                                    .returnExchangePolicy,
                                                color: CommonColor
                                                    .greyAppBarTextColor,
                                                maxLine: 2,
                                                fontFamily: AppStrings.poppins,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    returnExchangePolicyExpand =
                                                        returnExchangePolicyExpand
                                                            ? false
                                                            : true;
                                                  });
                                                },
                                                child: Icon(
                                                    returnExchangePolicyExpand
                                                        ? Icons.remove
                                                        : Icons.add))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          height: 1,
                                          width: SizeConfig.fullWidth,
                                          color:
                                              CommonColor.greyAppBarTextColor,
                                        ),
                                        const SizedBox(
                                          height: 13,
                                        ),
                                        returnExchangePolicyExpand
                                            ? productDetailData
                                                    .responseData!
                                                    .products!
                                                    .returnPolicy!
                                                    .isNotEmpty
                                                ? Html(
                                                    data: productDetailData
                                                        .responseData!
                                                        .products!
                                                        .manufactureProduct!)
                                                : TextWidget(
                                                    text: productDetailData
                                                        .responseData!
                                                        .products!
                                                        .returnPolicy!,
                                                    // AppStrings
                                                    //     .returnExchangePolicyContent,
                                                    color: CommonColor
                                                        .greyAppBarTextColor,
                                                    maxLine: 20,
                                                    fontFamily:
                                                        AppStrings.poppins,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10)
                                            : const SizedBox(),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const TextWidget(
                                            text: AppStrings.contactToknowMore,
                                            color: CommonColor.textColorBlack,
                                            maxLine: 20,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        TextFormFieldWidget(
                                          controller: _nameTextController,
                                          height: 40,
                                          hintText: AppStrings.name,
                                          readOnly: false,
                                          maxLine: 1,
                                          keyType: TextInputType.text,
                                          wordLimit: 25,
                                          onChanged: (value) {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextFormFieldWidget(
                                                controller:
                                                    _emailTextController,
                                                height: 40,
                                                hintText: AppStrings.email,
                                                readOnly: false,
                                                maxLine: 1,
                                                keyType: TextInputType.text,
                                                wordLimit: 25,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 9,
                                            ),
                                            Expanded(
                                              child: TextFormFieldWidget(
                                                controller:
                                                    _phoneTextController,
                                                height: 40,
                                                hintText:
                                                    AppStrings.phoneNumber,
                                                readOnly: false,
                                                maxLine: 1,
                                                keyType: TextInputType.number,
                                                wordLimit: 10,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormFieldWidget(
                                          controller: _messageTextController,
                                          height: 40,
                                          hintText: AppStrings.message,
                                          readOnly: false,
                                          maxLine: 5,
                                          keyType: TextInputType.text,
                                          wordLimit: 100,
                                          onChanged: (value) {},
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              if (_nameTextController
                                                      .text.isNotEmpty &&
                                                  _emailTextController
                                                      .text.isNotEmpty &&
                                                  _phoneTextController
                                                      .text.isNotEmpty &&
                                                  _messageTextController
                                                      .text.isNotEmpty) {
                                                _enquiry(productDetailData
                                                    .responseData!.products!.id!
                                                    .toString());
                                              } else {
                                                Util.displayToast(
                                                    "Please fill all the fields",
                                                    context);
                                              }
                                            },
                                            child: Container(
                                              height: 40,
                                              width: SizeConfig.fullWidth,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                color: CommonColor
                                                    .blueBottomNavContentColorActive,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                              ),
                                              child: const TextWidget(
                                                  text: AppStrings.enquireNow,
                                                  color: CommonColor.whiteColor,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12),
                                            ))
                                      ],
                                    )),
                              ),
                            ),
                            bottomNavigationBar: varientId == 0
                                ? SizedBox()
                                : Container(
                                    height: 60,
                                    decoration: const BoxDecoration(
                                      color: CommonColor.textColorBlack,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 150,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: CommonColor
                                                      .textColorBlack),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: CommonColor
                                                  .grayHomeGridViewBg),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (cartCount > 0) {
                                                      cartCount = cartCount - 1;
                                                    }
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.remove,
                                                  //size: 15,
                                                ),
                                              ),
                                              TextWidget(
                                                  text: cartCount.toString(),
                                                  color: CommonColor
                                                      .textColorBlack,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    cartCount = cartCount + 1;
                                                  });
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  //size: 15,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            if (cartCount > 0) {
                                              final prefs =
                                                  await Util.sharedPrefs;
                                              if (prefs.getString(
                                                          Constant.authToken) !=
                                                      null &&
                                                  prefs
                                                      .getString(
                                                          Constant.authToken)!
                                                      .isNotEmpty) {
                                                _addCart(productId.toString(),
                                                        varientId.toString())
                                                    .then((value) {
                                                  if (value) {
                                                    dataProvider
                                                        .getCartCountData(
                                                            context)
                                                        .then((value) {
                                                      if (value) {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const CartPage(
                                                                    fromBottomNav:
                                                                        false,
                                                                  )),
                                                        );
                                                      }
                                                    });
                                                  }
                                                });
                                              } else {
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LoginPage()),
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 45,
                                            width: 188,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: CommonColor
                                                    .grayHomeGridViewBg),
                                            child: const TextWidget(
                                                text: AppStrings.addToCartCap,
                                                color:
                                                    CommonColor.textColorBlack,
                                                maxLine: 1,
                                                fontFamily: AppStrings.poppins,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        );
                } else {
                  return Center(
                    child: Text("Empty"),
                  );
                }
              }),
        ),
      );
    });
  }
}
