import 'dart:convert';
import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:happy_bark/models/address/address_list_response.dart';
import 'package:happy_bark/models/cart/cart_list_response.dart';
import 'package:happy_bark/models/products/pincode_check_response.dart';
import 'package:happy_bark/screens/address/add_address.dart';
import 'package:happy_bark/screens/cart/order_placed_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:happy_bark/widgets/alertdialog_with_two_action.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/bottom_nav_bar.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  final bool fromBottomNav;
  const CartPage({Key? key, required this.fromBottomNav}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final NetworkUtility _networkUtility = NetworkUtility();
  bool _shouldDisplayLoader = false, addressSelected = false;
  int addressIndex = 0;
  int totalPrice = 0;
  final _searchTextController = TextEditingController();
  // List<int> cartCount = [];
  // List<CartList> cartItems = [];
  List<AddressListData>? _addressListData = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FutureDataProvider>(context, listen: false)
          .getCartListData(context);
    });
    _addressList();
    super.initState();
  }

  Future _addressList() async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }

    final value = await _networkUtility.makeWebServiceGetRequestForPagination(
        context: context, url: UrlConstant.addressList);
    //  log("listFormSubmissionDataUrl : " + value);
    var response = AddressListResponse.fromJson(json.decode(value));
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = false;
      });
    }
    if (response.status!) {
      if (mounted) {
        setState(() {
          for (int i = 0; i < response.responseData!.data!.length; i++) {
            if (response.responseData!.data![i].setPrimary == 'true') {
              addressSelected = true;
              addressIndex = i;
            }
          }
          _addressListData = response.responseData!.data ?? [];
        });
        //  _shouldDisplayLoaderForAddCart = false;

      }
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
    }
  }

  Future<bool> _deleteAddress(String id, int index) async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }

    final value = await _networkUtility.makeWebServiceGetRequestForPagination(
      context: context,
      url: UrlConstant.deleteAddress + "\/" + id,
    );
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
      return true;
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
      return false;
    }
  }

  Future<bool> _addCart(String id, String varId, String quantity) async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    Map<String, dynamic> body = {
      "product_id": id,
      "varient_id": varId,
      "quantity": quantity,
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
        //  _shouldDisplayLoaderForAddCart = false;
        Util.displayToast(
            response.responseMessage ?? AppStrings.somethingWentWrong, context);
      }
      return true;
    } else {
      Util.displayToast(
          response.responseMessage ?? AppStrings.somethingWentWrong, context);
      return false;
    }
  }

  Future<bool> _orderPlace(
      String id, String totalAmount, String quantity, String addressId) async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }
    Map<String, dynamic> body = {
      "transaction_id": '123',
      "address_id": addressId,

      ///"payment_id": "123",
      //"product_id": id,
      "payment_type": "online",
      "total_amount": totalAmount,
      // "qty": quantity,
      "status": "complete",
    };
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    final value = await _networkUtility.makeWebServiceRequestJsonBody(
        context: context,
        url: UrlConstant.addOrder,
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
        //  _shouldDisplayLoaderForAddCart = false;
        Util.displayToast(
            response.responseMessage ?? AppStrings.somethingWentWrong, context);
      }
      return true;
    } else {
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
        backgroundColor: CommonColor.whiteColor,
        appBar: CustomAppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 0),
            child: Container(
              width: 197,
              alignment: Alignment.centerLeft,
              child: const Text(
                AppStrings.cart,
                style: TextStyle(
                    color: CommonColor.greyBottomNavContentColorInactive,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ),
          ),
          isback: true,
          fromBottomNav: widget.fromBottomNav,
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
                if (widget.fromBottomNav) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const BottomNavBar()),
                      (route) => false);
                }
              },
              child: Icon(
                Icons.home_outlined,
                //  size: 20,
                color: CommonColor.greyBottomNavContentColorInactive,
              ),
            ),
            // SizedBox(
            //   width: 13,
            // ),
            // Icon(
            //   Icons.badge,
            //   //  size: 20,
            //   color: CommonColor.greyBottomNavContentColorInactive,
            // ),
            SizedBox(
              width: 16,
            )
          ],
          controller: _searchTextController,
        ),
        body: SafeArea(
          child: FutureBuilder(
              future: dataProvider.cartListData,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: CommonColor
                          .blueBottomNavContentColorActive, //<-- SEE HERE
                      backgroundColor: CommonColor
                          .greyBottomNavContentColorInactive, //<-- SEE HERE
                    ),
                    // children: [
                    //   // productDetailShimmer()
                    // ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Empty"),
                  );
                } else if (snapshot.hasData) {
                  final cartListData = CartListResponse.fromJson(
                      json.decode(snapshot.data.toString()));
                  cartListData.responseData!.cartList?.forEach((element) {
                    // cartItems.add(element);
                    // cartCount.add(element.quantity!);
                    if (element.amount != null) {
                      totalPrice = totalPrice + element.amount!;
                    }

                    if (addressIndex != 0) {
                      dataProvider.addressIndex = addressIndex;
                    }
                  });
                  return cartListData.responseData!.cartList!.isEmpty
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 209,
                                height: 209,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF0F0F0),
                                  shape: CircleBorder(),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(50.0),
                                  child: Image.asset(
                                    "assets/images/empty_cart.png",
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Text(
                                'Cart is empty',
                                style: TextStyle(
                                  color: Color(0xFF3A3A3A),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
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
                                child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const TextWidget(
                                      text: AppStrings.myCart,
                                      color: CommonColor
                                          .blueBottomNavContentColorActive,
                                      maxLine: 1,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  ListView.builder(
                                      itemCount: cartListData
                                          .responseData!.cartList!.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            index == 0
                                                ? SizedBox(
                                                    height: 0,
                                                  )
                                                : SizedBox(
                                                    height: 21,
                                                  ),
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 4.0,
                                                          spreadRadius: 0.0,
                                                          offset: Offset(
                                                            4.0, // Move to right 7.0 horizontally
                                                            4.0, // Move to bottom 8.0 Vertically
                                                          ))
                                                    ],
                                                  ),
                                                  child: cartListData
                                                              .responseData!
                                                              .images!
                                                              .length ==
                                                          cartListData
                                                              .responseData!
                                                              .cartList!
                                                              .length
                                                      ? ExtendedImage.network(
                                                          UrlConstant
                                                                  .baseUrlFile +
                                                              'uploads/products/' +
                                                              cartListData
                                                                  .responseData!
                                                                  .images![
                                                                      index]
                                                                  .images!,
                                                          fit: BoxFit.fill,
                                                          width: 78,
                                                          height: 78,
                                                          cache: true,
                                                        )
                                                      : Image.asset(
                                                          'assets/images/product_img1.png',
                                                          fit: BoxFit.fill,
                                                          width: 78,
                                                          height: 78,
                                                        ),
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextWidget(
                                                        text: cartListData
                                                                .responseData!
                                                                .cartList![
                                                                    index]
                                                                .productName ??
                                                            '',
                                                        //AppStrings.productContent,
                                                        color: CommonColor
                                                            .greyAppBarTextColor,
                                                        maxLine: 2,
                                                        fontFamily:
                                                            AppStrings.poppins,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        TextWidget(
                                                            text: cartListData
                                                                    .responseData!
                                                                    .cartList![
                                                                        index]
                                                                    .brandName ??
                                                                '',
                                                            // AppStrings.royalCanin,
                                                            color: CommonColor
                                                                .greyAppBarTextColor,
                                                            maxLine: 2,
                                                            fontFamily:
                                                                AppStrings
                                                                    .poppins,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 10),
                                                        TextWidget(
                                                            text: '₹ ' +
                                                                cartListData
                                                                    .responseData!
                                                                    .cartList![
                                                                        index]
                                                                    .amount!
                                                                    .toString(), //'₹1080.00',
                                                            color: CommonColor
                                                                .blueBottomNavContentColorActive,
                                                            maxLine: 1,
                                                            fontFamily:
                                                                AppStrings
                                                                    .poppins,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        // Container(
                                                        //   width: 60,
                                                        //   height: 25,
                                                        //   alignment: Alignment.center,
                                                        //   decoration: BoxDecoration(
                                                        //       border: Border.all(
                                                        //           width: 1,
                                                        //           color: CommonColor
                                                        //               .greyBottomNavContentColorInactive),
                                                        //       borderRadius:
                                                        //           BorderRadius.circular(
                                                        //               5)),
                                                        //   child: TextWidget(
                                                        //       text: '2 Kg',
                                                        //       color: CommonColor
                                                        //           .textColorBlack,
                                                        //       maxLine: 1,
                                                        //       fontFamily:
                                                        //           AppStrings.poppins,
                                                        //       fontWeight: FontWeight.w500,
                                                        //       fontSize: 10),
                                                        // ),
                                                        SizedBox(),
                                                        Container(
                                                          width: 78,
                                                          height: 25,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: CommonColor
                                                                      .greyBottomNavContentColorInactive),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  _addCart(
                                                                          cartListData
                                                                              .responseData!
                                                                              .cartList![
                                                                                  index]
                                                                              .productId
                                                                              .toString(),
                                                                          cartListData
                                                                              .responseData!
                                                                              .cartList![index]
                                                                              .varientId!
                                                                              .toString(),
                                                                          (-1).toString())
                                                                      .then((value) {
                                                                    if (value) {
                                                                      dataProvider
                                                                          .getCartListData(
                                                                              context);
                                                                    }

                                                                    // if (value) {
                                                                    //   if (cartListData
                                                                    //           .responseData!
                                                                    //           .cartList![
                                                                    //               index]
                                                                    //           .quantity! >
                                                                    //       0) {
                                                                    //     cartListData
                                                                    //         .responseData!
                                                                    //         .cartList![
                                                                    //             index]
                                                                    //         .quantity = cartListData
                                                                    //             .responseData!
                                                                    //             .cartList![
                                                                    //                 index]
                                                                    //             .quantity! -
                                                                    //         1;
                                                                    //     log("quantity :" +
                                                                    //         (cartListData
                                                                    //             .responseData!
                                                                    //             .cartList![
                                                                    //                 index]
                                                                    //             .quantity
                                                                    //             .toString()));
                                                                    //   }

                                                                    //   setState(() {});
                                                                    // }
                                                                  });
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.remove,
                                                                  size: 15,
                                                                ),
                                                              ),
                                                              TextWidget(
                                                                  text: cartListData
                                                                      .responseData!
                                                                      .cartList![
                                                                          index]
                                                                      .quantity
                                                                      .toString(),
                                                                  color: CommonColor
                                                                      .textColorBlack,
                                                                  maxLine: 1,
                                                                  fontFamily:
                                                                      AppStrings
                                                                          .poppins,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 10),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  _addCart(
                                                                          cartListData
                                                                              .responseData!
                                                                              .cartList![
                                                                                  index]
                                                                              .productId
                                                                              .toString(),
                                                                          cartListData
                                                                              .responseData!
                                                                              .cartList![index]
                                                                              .varientId!
                                                                              .toString(),
                                                                          1.toString())
                                                                      .then((value) {
                                                                    if (value) {
                                                                      dataProvider
                                                                          .getCartListData(
                                                                              context);
                                                                    }
                                                                    // if (value) {
                                                                    //   setState(
                                                                    //       () {
                                                                    //     cartListData
                                                                    //         .responseData!
                                                                    //         .cartList![
                                                                    //             index]
                                                                    //         .quantity = cartListData
                                                                    //             .responseData!.cartList![index].quantity! +
                                                                    //         1;
                                                                    //     log("quantity  22 :" +
                                                                    //         jsonEncode(cartListData.responseData!.cartList![index].quantity.toString()));
                                                                    //   });
                                                                    // }
                                                                  });
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.add,
                                                                  size: 15,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 21,
                                            ),
                                            const MySeparator(
                                                color: Colors.grey),
                                          ],
                                        );
                                      }),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/coupon.png",
                                                width: 20,
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              TextWidget(
                                                  text: AppStrings
                                                      .haveCouponGiftCard,
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 28),
                                            child: TextWidget(
                                                text: AppStrings
                                                    .enterCouponGiftAvailDiscounts,
                                                color: CommonColor
                                                    .greyAppBarTextColor,
                                                maxLine: 1,
                                                fontFamily: AppStrings.poppins,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextWidget(
                                      text: AppStrings.orderSummary,
                                      color: CommonColor.greyAppBarTextColor,
                                      maxLine: 1,
                                      fontFamily: AppStrings.poppins,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  const MySeparator(color: Colors.grey),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                          text: AppStrings.orderTotal,
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      TextWidget(
                                          text: '₹ ' + totalPrice.toString(),
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                          text: AppStrings.shippingCharges,
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      TextWidget(
                                          text: '₹ 0',
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                          text: AppStrings.discount,
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      TextWidget(
                                          text: '₹ 0',
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  const MySeparator(color: Colors.grey),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                          text: AppStrings.grandTotal,
                                          color:
                                              CommonColor.greyAppBarTextColor,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      TextWidget(
                                          text: '₹ ' + totalPrice.toString(),
                                          color:
                                              CommonColor.greyAppBarTextColor,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                            bottomNavigationBar: Container(
                              height: 231,
                              width: SizeConfig.fullWidth,
                              child: Column(
                                children: [
                                  Container(
                                    height: 76,
                                    width: SizeConfig.fullWidth,
                                    color: CommonColor.grayHomeGridViewBg,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 42,
                                          right: 24,
                                          top: 18,
                                          bottom: 18),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                  text: AppStrings
                                                      .deliveryAddress,
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12),
                                              GestureDetector(
                                                onTap: () {
                                                  addAddressBottomSheet(
                                                      dataProvider);
                                                },
                                                child: TextWidget(
                                                    text: AppStrings.plusADD,
                                                    color: CommonColor
                                                        .blueBottomNavContentColorActive,
                                                    maxLine: 1,
                                                    fontFamily:
                                                        AppStrings.poppins,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          addressSelected
                                              ? TextWidget(
                                                  text: _addressListData![
                                                              dataProvider
                                                                  .addressIndex!]
                                                          .address1! +
                                                      ', ' +
                                                      _addressListData![
                                                              dataProvider
                                                                  .addressIndex!]
                                                          .address2! +
                                                      ', ' +
                                                      _addressListData![
                                                              dataProvider
                                                                  .addressIndex!]
                                                          .city! +
                                                      ", " +
                                                      _addressListData![
                                                              dataProvider
                                                                  .addressIndex!]
                                                          .state! +
                                                      ", " +
                                                      _addressListData![
                                                              dataProvider
                                                                  .addressIndex!]
                                                          .pincode!,
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 2,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10)
                                              : TextWidget(
                                                  text:
                                                      AppStrings.noAddressesYet,
                                                  color: CommonColor
                                                      .greyAppBarTextColor,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  /*  Padding(
                                  padding: const EdgeInsets.only(left: 18, right: 26),
                                  child: GestureDetector(
                    onTap: () {
                      selectPayMethordBottomSheet();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/credit_card.png",
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                TextWidget(
                                    text: AppStrings.payUsing,
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 28),
                              child: TextWidget(
                                  text: AppStrings.selectPaymentMethod,
                                  color: CommonColor.greyAppBarTextColor,
                                  maxLine: 1,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                        )
                      ],
                    ),
                                  ),
                                ),
                             */
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 18),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (addressSelected) {
                                          _orderPlace(
                                                  cartListData.responseData!
                                                      .cartList![0].productId
                                                      .toString(),
                                                  totalPrice.toString(),
                                                  cartListData.responseData!
                                                      .cartList![0].quantity
                                                      .toString(),
                                                  _addressListData![
                                                          addressIndex]
                                                      .id
                                                      .toString())
                                              .then((value) {
                                            if (value) {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const OrderPalcedPage(
                                                          success: true,
                                                        )),
                                              );
                                            } else {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const OrderPalcedPage(
                                                          success: false,
                                                        )),
                                              );
                                            }
                                          });
                                        } else {
                                          Util.displayToast(
                                              "Please Select Address", context);
                                        }
                                      },
                                      child: Container(
                                        height: 48,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: CommonColor
                                                .blueBottomNavContentColorActive),
                                        child: TextWidget(
                                            text: AppStrings.proceedCheckout,
                                            color: CommonColor.whiteColor,
                                            maxLine: 1,
                                            fontFamily: AppStrings.poppins,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                      ),
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

  Future<bool> addAddressBottomSheet(FutureDataProvider dataProvider) async {
    return await showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                    height: SizeConfig.fullHeight! * 0.5,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: _addressListData!.isEmpty
                          ? Center(
                              child: TextWidget(
                                  text: AppStrings.noAddressesFound,
                                  color: CommonColor.greyAppBarTextColor,
                                  maxLine: 1,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: ListView.separated(
                                  itemCount: _addressListData!.length,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 8,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          // addressIndex = index;
                                          addressSelected = true;
                                        });
                                        dataProvider.changeAddressIndex(index);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 1,
                                                color: CommonColor
                                                    .greyBottomNavContentColorInactive)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              dataProvider.addressIndex !=
                                                          null &&
                                                      dataProvider
                                                              .addressIndex ==
                                                          index
                                                  ? Container(
                                                      height: 18,
                                                      width: 18,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: CommonColor
                                                              .blueBottomNavContentColorActive),
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Icon(
                                                        Icons.check,
                                                        color: CommonColor
                                                            .whiteColor,
                                                        size: 10,
                                                      ),
                                                    )
                                                  : Container(
                                                      height: 18,
                                                      width: 18,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: CommonColor
                                                                  .greyBottomNavContentColorInactive),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color: CommonColor
                                                              .whiteColor),
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: TextWidget(
                                                              text:
                                                                  _addressListData![
                                                                          index]
                                                                      .fullName!,
                                                              color:
                                                                  CommonColor
                                                                      .greyAppBarTextColor,
                                                              maxLine: 1,
                                                              fontFamily:
                                                                  AppStrings
                                                                      .poppins,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15),
                                                        ),
                                                        Row(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              AddAddressPage(
                                                                                addressListData: _addressListData![index],
                                                                              )),
                                                                ).then((value) {
                                                                  if (value !=
                                                                      null) {
                                                                    Navigator.pop(
                                                                        context);
                                                                    _addressList();
                                                                  }
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons.edit,
                                                                color: CommonColor
                                                                    .greyColor,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialogWithTwoAction(
                                                                      context:
                                                                          context,
                                                                      title: AppStrings
                                                                          .deleteAsk,
                                                                      content:
                                                                          AppStrings
                                                                              .areYouSureAsk,
                                                                      okText:
                                                                          AppStrings
                                                                              .ok,
                                                                      cancelText:
                                                                          AppStrings
                                                                              .cancel,
                                                                      okOnPressed:
                                                                          () {
                                                                        _deleteAddress(_addressListData![index].id.toString(),
                                                                                index)
                                                                            .then((value) {
                                                                          if (value) {
                                                                            setState(() {
                                                                              _addressListData!.removeAt(index);
                                                                            });
                                                                          }
                                                                        });
                                                                      },
                                                                      cancelOnPressed:
                                                                          () {},
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons.delete,
                                                                color: CommonColor
                                                                    .redColors,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    TextWidget(
                                                        text: _addressListData![
                                                                    index]
                                                                .address1! +
                                                            ', ' +
                                                            _addressListData![
                                                                    index]
                                                                .address2! +
                                                            ', ' +
                                                            _addressListData![
                                                                    index]
                                                                .city! +
                                                            ", " +
                                                            _addressListData![
                                                                    index]
                                                                .state! +
                                                            ", " +
                                                            _addressListData![
                                                                    index]
                                                                .pincode!,
                                                        color: CommonColor
                                                            .greyAppBarTextColor,
                                                        maxLine: 3,
                                                        fontFamily:
                                                            AppStrings.poppins,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 12),
                                                    SizedBox(
                                                      height: 8,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                      bottomNavigationBar: Padding(
                        padding: EdgeInsets.only(
                            left: 18, right: 18, top: 18, bottom: 18),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddAddressPage()),
                            ).then((value) {
                              if (value != null) {
                                Navigator.pop(context);
                                _addressList();
                              }
                            });
                          },
                          child: Container(
                            height: 48,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: CommonColor
                                    .blueBottomNavContentColorActive),
                            child: TextWidget(
                                text: AppStrings.addAddress,
                                color: CommonColor.whiteColor,
                                maxLine: 1,
                                fontFamily: AppStrings.poppins,
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ));
              });
            }) ??
        false; //if showDialouge had returned null, then return false
  }

  Future<bool> selectPayMethordBottomSheet() async {
    return await showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                    height: SizeConfig.fullHeight! * 0.5,
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Padding(
                        padding: const EdgeInsets.only(
                            top: 30, left: 20, right: 20, bottom: 30),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                  text: AppStrings.selectPaymentMethod,
                                  color: CommonColor.greyAppBarTextColor,
                                  maxLine: 1,
                                  fontFamily: AppStrings.poppins,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/credit_card_trans.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget(
                                          text:
                                              AppStrings.addCreditDebitATMCards,
                                          color:
                                              CommonColor.greyAppBarTextColor,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              const MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/wallet.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget(
                                          text: AppStrings.wallet,
                                          color:
                                              CommonColor.greyAppBarTextColor,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              const MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/upi.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget(
                                          text: AppStrings.upi,
                                          color:
                                              CommonColor.greyAppBarTextColor,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              const MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/bank_transfer.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget(
                                          text: AppStrings.netBanking,
                                          color:
                                              CommonColor.greyAppBarTextColor,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              const MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/money.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget(
                                          text: AppStrings.cashOnDelivery,
                                          color:
                                              CommonColor.greyAppBarTextColor,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ],
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              const MySeparator(color: Colors.grey),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              });
            }) ??
        false; //if showDialouge had returned null, then return false
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 3.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
