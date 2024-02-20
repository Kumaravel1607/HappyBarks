import 'dart:convert';
import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:happy_bark/models/order/order_detail_response.dart';
import 'package:happy_bark/models/products/pincode_check_response.dart';
import 'package:happy_bark/models/products/product_detail_response.dart';
import 'package:happy_bark/screens/cart/cart_screen.dart';
import 'package:happy_bark/screens/login/login_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/formated_date_time.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/shimmer/orderDetailsPageShimmer.dart';
import 'package:happy_bark/utils/shimmer/productDetailPageShimmer.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';
import 'package:happy_bark/widgets/app_bar/custom_app_bar.dart';
import 'package:happy_bark/widgets/bottom_nav_bar.dart';
import 'package:happy_bark/widgets/text_form_field.dart';
import 'package:happy_bark/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatefulWidget {
  final String id;
  const OrderDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final NetworkUtility _networkUtility = NetworkUtility();
  bool _shouldDisplayLoaderForPin = false,
      _shouldDisplayLoaderForEnq = false,
      _shouldDisplayLoaderForAddCart = false;
  final _searchTextController = TextEditingController();
  final _pinTextController = TextEditingController();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _messageTextController = TextEditingController();
  int _selectedSize = 0, cartCount = 0, productId = 0, varientId = 0;
  bool returnExchangePolicyExpand = true;
  int _selectedIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FutureDataProvider>(context, listen: false)
          .getOrderDetailsData(context, widget.id);
    });

    super.initState();
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
              child: const Text(
                AppStrings.orderDetails,
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
              future: dataProvider.orderDetailsData,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [orderDetailsShimmer()],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Empty"),
                  );
                } else if (snapshot.hasData) {
                  final orderDetailData = OrderDetailResponse.fromJson(
                      json.decode(snapshot.data.toString()));

                  return SingleChildScrollView(
                    child: Container(
                      color: CommonColor.whiteColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 14,
                              right: 20,
                            ),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const TextWidget(
                                              text:
                                                  AppStrings.orderNumber + " :",
                                              color: CommonColor
                                                  .greyBottomNavContentColorInactive,
                                              maxLine: 1,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextWidget(
                                              text: orderDetailData
                                                      .responseData!
                                                      .orderList!
                                                      .orderId ??
                                                  '',
                                              color:
                                                  CommonColor.textColorBalck1,
                                              maxLine: 1,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const TextWidget(
                                              text: AppStrings.orderDate + " :",
                                              color: CommonColor
                                                  .greyBottomNavContentColorInactive,
                                              maxLine: 1,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextWidget(
                                              text: FormatedDateTime
                                                  .formatedDateTime(
                                                      orderDetailData
                                                              .responseData!
                                                              .orderList!
                                                              .createdAt ??
                                                          '',
                                                      inputFormat:
                                                          'yyyy-MM-dd hh:mm:ss',
                                                      outputFormat: 'd MMM y'),
                                              color:
                                                  CommonColor.textColorBalck1,
                                              maxLine: 1,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 21,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextWidget(
                                          text: AppStrings.shipmentOfOneOfOne,
                                          color: CommonColor.textColorBalck1,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                      const TextWidget(
                                          text: "1 " + AppStrings.items,
                                          color: CommonColor.textColorBalck1,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  const MySeparator(
                                      color: CommonColor
                                          .greyBottomNavContentColorInactive),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: CommonColor.textColorGreen1,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.check,
                                          color: CommonColor.whiteColor,
                                          size: 18,
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        width: SizeConfig.fullWidth,
                                        height: 1,
                                        color:
                                            CommonColor.lightGreyForTextField,
                                      )),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: CommonColor.textColorGreen1,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.check,
                                          color: CommonColor.whiteColor,
                                          size: 18,
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        width: SizeConfig.fullWidth,
                                        height: 1,
                                        color:
                                            CommonColor.lightGreyForTextField,
                                      )),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: orderDetailData.responseData!
                                                        .orderList!.status ==
                                                    'complete'
                                                ? CommonColor.textColorGreen1
                                                : CommonColor
                                                    .lightGreyForTextField,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        alignment: Alignment.center,
                                        child: orderDetailData.responseData!
                                                    .orderList!.status ==
                                                'complete'
                                            ? Icon(
                                                Icons.check,
                                                size: 18,
                                                color: CommonColor.whiteColor,
                                              )
                                            : null,
                                      ),
                                      Expanded(
                                          child: Container(
                                        width: SizeConfig.fullWidth,
                                        height: 1,
                                        color:
                                            CommonColor.lightGreyForTextField,
                                      )),
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: orderDetailData.responseData!
                                                        .orderList!.status ==
                                                    'complete'
                                                ? CommonColor.textColorGreen1
                                                : CommonColor
                                                    .lightGreyForTextField,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        alignment: Alignment.center,
                                        child: orderDetailData.responseData!
                                                    .orderList!.status ==
                                                'complete'
                                            ? Icon(
                                                Icons.check,
                                                size: 18,
                                                color: CommonColor.whiteColor,
                                              )
                                            : null,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextWidget(
                                          text: AppStrings.confirmed,
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      const TextWidget(
                                          text: AppStrings.shipped,
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      const TextWidget(
                                          text: AppStrings.outForDelivery,
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                      const TextWidget(
                                          text: AppStrings.delivered,
                                          color: CommonColor
                                              .greyBottomNavContentColorInactive,
                                          maxLine: 1,
                                          fontFamily: AppStrings.poppins,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  const MySeparator(
                                      color: CommonColor
                                          .greyBottomNavContentColorInactive),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  ListView.separated(
                                      itemCount: orderDetailData
                                          .responseData!.orderItems!.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      separatorBuilder: (context, index) {
                                        return SizedBox(
                                          height: 16,
                                        );
                                      },
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: ShapeDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      UrlConstant.baseUrlFile +
                                                          'uploads/products/' +
                                                          (orderDetailData
                                                                  .responseData!
                                                                  .orderItems![
                                                                      index]
                                                                  .image ??
                                                              '')),
                                                  fit: BoxFit.fill,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                shadows: [
                                                  BoxShadow(
                                                    color: Color(0x3F000000),
                                                    blurRadius: 4,
                                                    offset: Offset(4, 4),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    child: TextWidget(
                                                        text: orderDetailData
                                                                .responseData!
                                                                .orderItems![
                                                                    index]
                                                                .name ??
                                                            '',
                                                        color: CommonColor
                                                            .greyAppBarTextColor,
                                                        maxLine: 2,
                                                        fontFamily:
                                                            AppStrings.poppins,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 10),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      TextWidget(
                                                          text: "₹ " +
                                                              (orderDetailData
                                                                          .responseData!
                                                                          .orderItems![
                                                                              index]
                                                                          .amount ??
                                                                      0)
                                                                  .toString(),
                                                          color: CommonColor
                                                              .blueBottomNavContentColorActive,
                                                          maxLine: 1,
                                                          fontFamily: AppStrings
                                                              .poppins,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10),
                                                      TextWidget(
                                                          text: "QTY : " +
                                                              (orderDetailData
                                                                          .responseData!
                                                                          .orderItems![
                                                                              index]
                                                                          .quantity ??
                                                                      0)
                                                                  .toString(),
                                                          color: CommonColor
                                                              .greyAppBarTextColor,
                                                          maxLine: 1,
                                                          fontFamily: AppStrings
                                                              .poppins,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10),
                                                      TextWidget(
                                                          text: "SIZE : " +
                                                              (orderDetailData
                                                                      .responseData!
                                                                      .orderItems![
                                                                          index]
                                                                      .size ??
                                                                  ''),
                                                          color: CommonColor
                                                              .greyAppBarTextColor,
                                                          maxLine: 1,
                                                          fontFamily: AppStrings
                                                              .poppins,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: SizeConfig.fullWidth,
                            height: 10,
                            color: CommonColor.grayHomeGridViewBg,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                    text: AppStrings.shippingAddress,
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                                const SizedBox(
                                  height: 8,
                                ),
                                const MySeparator(
                                    color: CommonColor
                                        .greyBottomNavContentColorInactive),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextWidget(
                                    text: orderDetailData
                                            .responseData!.address?.fullName ??
                                        '',
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                                SizedBox(
                                  height: 8,
                                ),
                                if (orderDetailData.responseData!.address !=
                                    null)
                                  SizedBox(
                                    width: SizeConfig.fullWidth! * 0.65,
                                    child: TextWidget(
                                        text: orderDetailData.responseData!
                                                .address!.address1! +
                                            ', ' +
                                            orderDetailData.responseData!
                                                .address!.address2! +
                                            ', ' +
                                            orderDetailData
                                                .responseData!.address!.city! +
                                            ", " +
                                            orderDetailData
                                                .responseData!.address!.state! +
                                            ", " +
                                            orderDetailData.responseData!
                                                .address!.pincode!,
                                        color: CommonColor
                                            .greyBottomNavContentColorInactive,
                                        maxLine: 4,
                                        fontFamily: AppStrings.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextWidget(
                                    text: "Phone: +91 " +
                                        (orderDetailData
                                                .responseData!.address?.phone ??
                                            ''),
                                    color: CommonColor.greyAppBarTextColor,
                                    maxLine: 1,
                                    fontFamily: AppStrings.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: SizeConfig.fullWidth,
                            height: 10,
                            color: CommonColor.grayHomeGridViewBg,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                        text: '₹ ' +
                                            orderDetailData.responseData!
                                                .orderList!.totalAmount!,
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
                                        color: CommonColor.greyAppBarTextColor,
                                        maxLine: 1,
                                        fontFamily: AppStrings.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                    TextWidget(
                                        text: '₹ ' +
                                            orderDetailData.responseData!
                                                .orderList!.totalAmount!,
                                        color: CommonColor.greyAppBarTextColor,
                                        maxLine: 1,
                                        fontFamily: AppStrings.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
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
