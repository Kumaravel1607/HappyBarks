// ignore_for_file: prefer_typing_uninitialized_variables, prefer_is_empty, library_prefixes

import 'dart:convert';
import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:happy_bark/models/cart/cart_count_response.dart';
import 'package:happy_bark/models/home/home_response.dart';
import 'package:happy_bark/services/apiservice/cart_api_service.dart';
import 'package:happy_bark/services/apiservice/homeApiService.dart';
import 'package:happy_bark/services/apiservice/order_api_service.dart';
import 'package:happy_bark/services/apiservice/product_api_service.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/size_config.dart';
import 'package:happy_bark/utils/strings.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';

class FutureDataProvider with ChangeNotifier {
  final NetworkUtility _networkUtility = NetworkUtility();
  var homeData,
      brandsData,
      productsData,
      productDetailData,
      cartListData,
      orderDetailsData;
  int cartCount = 0;
  bool appbarVisibility = true;
  int? addressIndex;
  String appBarTitle = '';
  String nameOfUser = '';
  List<TopBanners> homeTopImgList = [], homeBottomImgList = [];
  List<Widget> homeTopImageSliders = [], homeBottomImageSliders = [];
  SizeConfig _sizeConfig = SizeConfig();
  FutureDataProvider() {
    _callSharedPrefs();
    // _clearAuth();
  }
  _clearAuth() async {
    final prefs = await Util.sharedPrefs;
    prefs.clear();
    notifyListeners();
  }

  _callSharedPrefs() async {
    final prefs = await Util.sharedPrefs;
    if (prefs.getString(Constant.name) != null &&
        prefs.getString(Constant.name)!.isNotEmpty) {
      nameOfUser = prefs.getString(Constant.name)!;
      appBarTitle = AppStrings.hiText +
          ', ' +
          prefs.getString(Constant.name)! +
          ', ' +
          AppStrings.welcomeBack;
    } else {
      appBarTitle = 'Hi,';
    }
    notifyListeners();
  }

  Future getHomeData(BuildContext context) async {
    homeData = HomeApiService.getHomeData(context);
    final homeDataResponse = HomeResponse.fromJson(jsonDecode(await homeData));
    homeTopImgList = homeDataResponse.responseData?.topBanners ?? [];
    homeBottomImgList = homeDataResponse.responseData?.bottomBanner ?? [];
    homeTopImageSliders = homeTopImgList
        .map((item) => GestureDetector(
              onTap: () {},
              child: Container(
                //margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    child: Stack(
                      children: <Widget>[
                        ExtendedImage.network(
                          UrlConstant.baseUrlFile +
                              'uploads/banners/' +
                              item.image!,
                          //"assets/images/farmina_logo.png",
                          height: 333,
                          width: SizeConfig.screenWidth,
                          fit: BoxFit.fitWidth,
                        ),
                        // Image.asset(
                        //   "assets/images/banner_home_1.png",
                        //   width: SizeConfig.screenWidth,
                        //   height: _sizeConfig.height! * 0.42,
                        //   fit: BoxFit.fitWidth,
                        //),
                        // Image.network(
                        //   // item.subTitle! + item.image!,
                        //   'https://cdn.cnn.com/cnnnext/dam/assets/160929101749-essential-spanish-dish-paella-phaidon-full-169.jpg',
                        //   fit: BoxFit.cover,
                        //   //   height: 212,
                        //   // width: 1000.0,
                        //   //cache: true,
                        // ),
                        // Positioned(
                        //   bottom: 0.0,
                        //   left: 0.0,
                        //   right: 0.0,
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //         gradient: LinearGradient(
                        //           colors: [
                        //             Color.fromARGB(200, 0, 0, 0),
                        //             Color.fromARGB(0, 0, 0, 0)
                        //           ],
                        //           begin: Alignment.bottomCenter,
                        //           end: Alignment.topCenter,
                        //         ),
                        //       ),
                        //       padding: EdgeInsets.symmetric(
                        //           vertical: 10.0, horizontal: 20.0),
                        //       child: Text("")
                        //       // Text(
                        //       //   'No. ${imgList.indexOf(item)} image',
                        //       //   style: TextStyle(
                        //       //     color: Colors.white,
                        //       //     fontSize: 20.0,
                        //       //     fontWeight: FontWeight.bold,
                        //       //   ),
                        //       // ),
                        //       ),
                        // ),
                      ],
                    )),
              ),
            ))
        .toList();
    homeBottomImageSliders = homeBottomImgList
        .map((item) => GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          // borderRadius:
                          //     const BorderRadius.all(Radius.circular(10)),
                          child: ExtendedImage.network(
                            UrlConstant.baseUrlFile +
                                'uploads/banners/' +
                                item.image!,
                            //"assets/images/farmina_logo.png",
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          // Image.asset(
                          //   "assets/images/banner_toys_1.png",
                          //   fit: BoxFit.fill,
                          //   width: double.infinity,
                          //   height: 200,
                          // ),
                        ),
                        // Image.network(
                        //   // item.subTitle! + item.image!,
                        //   'https://cdn.cnn.com/cnnnext/dam/assets/160929101749-essential-spanish-dish-paella-phaidon-full-169.jpg',
                        //   fit: BoxFit.cover,
                        //   //   height: 212,
                        //   // width: 1000.0,
                        //   //cache: true,
                        // ),
                        // Positioned(
                        //   bottom: 0.0,
                        //   left: 0.0,
                        //   right: 0.0,
                        //   child: Container(
                        //       decoration: BoxDecoration(
                        //         gradient: LinearGradient(
                        //           colors: [
                        //             Color.fromARGB(200, 0, 0, 0),
                        //             Color.fromARGB(0, 0, 0, 0)
                        //           ],
                        //           begin: Alignment.bottomCenter,
                        //           end: Alignment.topCenter,
                        //         ),
                        //       ),
                        //       padding: EdgeInsets.symmetric(
                        //           vertical: 10.0, horizontal: 20.0),
                        //       child: Text("")
                        //       // Text(
                        //       //   'No. ${imgList.indexOf(item)} image',
                        //       //   style: TextStyle(
                        //       //     color: Colors.white,
                        //       //     fontSize: 20.0,
                        //       //     fontWeight: FontWeight.bold,
                        //       //   ),
                        //       // ),
                        //       ),
                        // ),
                      ],
                    )),
              ),
            ))
        .toList();

    notifyListeners();
    return homeData;
  }

  Future<bool> getCartCountData(BuildContext context) async {
    final prefs = await Util.sharedPrefs;
    if (prefs.getString(Constant.authToken) != null &&
        prefs.getString(Constant.authToken)!.isNotEmpty) {
      Map<String, dynamic> body = {
        // "name": _nameTextController.text,
        // "phone": _mobileNoTextController.text
      };
      Map<String, String> header = {
        'Content-Type': 'application/json',
      };
      final value = await _networkUtility.makeWebServiceRequestJsonBody(
          context: context,
          url: UrlConstant.cartCount,
          body: jsonEncode(body),
          header: header);
      var response = CartCountResponse.fromJson(jsonDecode(value));
      log("loginUrl : " + jsonEncode(response));

      if (response.status!) {
        cartCount = response.responseData!.cartCount ?? 0;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future getProductDetailData(BuildContext context, int id) async {
    productDetailData = ProductApiService.getProductDetailData(context, id);
    notifyListeners();
    return productDetailData;
  }

  Future getCartListData(BuildContext context) async {
    // cartListData = CartApiService.getcartListData(context);
    notifyListeners();
    return cartListData;
  }

  Future getOrderDetailsData(BuildContext context, String id) async {
    orderDetailsData = OrderApiService.getorderDetailsData(context, id);
    notifyListeners();
    return orderDetailsData;
  }

  cartCountIncrease() {
    cartCount = cartCount + 1;
    notifyListeners();
  }

  cartCountDecrease() {
    cartCount = cartCount - 1;
    notifyListeners();
  }

  appbarVisible() {
    appbarVisibility = true;
    notifyListeners();
  }

  appBarInvisible() {
    appbarVisibility = false;
    notifyListeners();
  }

  changeAddressIndex(int index) {
    addressIndex = index;
    notifyListeners();
  }
}
