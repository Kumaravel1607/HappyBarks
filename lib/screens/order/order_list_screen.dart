import 'dart:convert';
import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:happy_bark/models/order/order_list_response.dart';
import 'package:happy_bark/models/products/pincode_check_response.dart';
import 'package:happy_bark/models/products/product_detail_response.dart';
import 'package:happy_bark/screens/cart/cart_screen.dart';
import 'package:happy_bark/screens/login/login_screen.dart';
import 'package:happy_bark/screens/order/order_detail_screen.dart';
import 'package:happy_bark/services/provider/futuredataProvider/futureDataProvider.dart';
import 'package:happy_bark/utils/colors.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/custom_grid_delegate.dart';
import 'package:happy_bark/utils/formated_date_time.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/shimmer/orderListPageShimmer.dart';
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

class OrderListPage extends StatefulWidget {
  const OrderListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  bool _shouldDisplayLoader = false;
  final NetworkUtility _networkUtility = NetworkUtility();
  final _searchTextController = TextEditingController();
  ScrollController? _controller = ScrollController();
  List<OrderListData> _orderListData = [];
  bool stopPagination = false,
      callForPagination = true,
      firstTimeCallApi = true;
  int page = 1;
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
          _fetchOrderDataList();
        }
      }
    });
    _fetchOrderDataList();
    super.initState();
  }

  Future _fetchOrderDataList() async {
    if (mounted) {
      setState(() {
        _shouldDisplayLoader = true;
      });
    }

    final value = await _networkUtility.makeWebServiceGetRequestForPagination(
      context: context,
      url: UrlConstant.orderListUrl + '?page=$page',
    );
    //  log("listFormSubmissionDataUrl : " + value);
    var response = OrderListResponse.fromJson(json.decode(value));

    if (response.status!) {
      if (mounted) {
        setState(() {
          callForPagination = false;
          if (response.responseData!.data!.isEmpty) {
            stopPagination = true;
          } else {
            response.responseData?.data?.forEach((element) {
              _orderListData.add(element);
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
              child: const Text(
                AppStrings.allOrders,
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
            child: (stopPagination && _orderListData.isEmpty)
                ? Center(
                    child: Text('Empty'),
                  )
                : SingleChildScrollView(
                    controller: _controller,
                    child: Container(
                      color: CommonColor.whiteColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     left: 28,
                          //     top: 30,
                          //     right: 28,
                          //   ),
                          //   child: const TextWidget(
                          //       text: AppStrings.allOrders,
                          //       color: CommonColor
                          //           .greyBottomNavContentColorInactive,
                          //       maxLine: 1,
                          //       fontFamily: AppStrings.poppins,
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 14),
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: _orderListData.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                width: SizeConfig.fullWidth,
                                height: 90,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(4, 0),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 38, right: 38, top: 12, bottom: 12),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              TextWidget(
                                                  text: AppStrings.orderDate,
                                                  color: CommonColor
                                                      .greyBottomNavContentColorInactive,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextWidget(
                                                  text: FormatedDateTime.formatedDateTime(
                                                      _orderListData[index]
                                                              .createdAt ??
                                                          '',
                                                      inputFormat:
                                                          'yyyy-MM-dd hh:mm:ss',
                                                      outputFormat: 'd MMM y'),
                                                  color: CommonColor
                                                      .textColorBalck1,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              TextWidget(
                                                  text: AppStrings.orderNumber,
                                                  color: CommonColor
                                                      .greyBottomNavContentColorInactive,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextWidget(
                                                  text: _orderListData[index]
                                                      .orderId!,
                                                  color: CommonColor
                                                      .textColorBalck1,
                                                  maxLine: 1,
                                                  fontFamily:
                                                      AppStrings.poppins,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderDetailPage(
                                                          id: _orderListData[
                                                                  index]
                                                              .id!
                                                              .toString(),
                                                        )),
                                              );
                                            },
                                            child: Container(
                                              decoration: ShapeDecoration(
                                                color: CommonColor
                                                    .blueBottomNavContentColorActive,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2)),
                                              ),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 10,
                                                    right: 10),
                                                child: TextWidget(
                                                    text: AppStrings
                                                        .orderDetailsCap,
                                                    color:
                                                        CommonColor.whiteColor,
                                                    maxLine: 1,
                                                    fontFamily:
                                                        AppStrings.poppins,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      AppStrings.deliveryDate +
                                                          " : ",
                                                  style: TextStyle(
                                                    color: CommonColor
                                                        .greyBottomNavContentColorInactive,
                                                    fontSize: 10,
                                                    fontFamily:
                                                        AppStrings.poppins,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: FormatedDateTime
                                                      .formatedDateTime(
                                                          _orderListData[index]
                                                                  .updatedAt ??
                                                              '',
                                                          inputFormat:
                                                              'yyyy-MM-dd hh:mm:ss',
                                                          outputFormat:
                                                              'd MMM y'),
                                                  style: TextStyle(
                                                    color: CommonColor
                                                        .textColorBalck1,
                                                    fontSize: 10,
                                                    fontFamily:
                                                        AppStrings.poppins,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          TextWidget(
                                              text: _orderListData[index]
                                                          .status ==
                                                      'complete'
                                                  ? AppStrings.delivered
                                                  : AppStrings.orderPending,
                                              color: _orderListData[index]
                                                          .status ==
                                                      'complete'
                                                  ? CommonColor.textColorGreen1
                                                  : CommonColor
                                                      .textColorOrange1,
                                              maxLine: 1,
                                              fontFamily: AppStrings.poppins,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 15);
                            },
                          ),
                          if (callForPagination) orderListShimmer()
                        ],
                      ),
                    ),
                  )),
      );
    });
  }
}
