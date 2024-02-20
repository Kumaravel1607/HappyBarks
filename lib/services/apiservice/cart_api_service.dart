import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';

class CartApiService {
  static Future<String> getcartCountData(BuildContext context) async {
    final prefs = await Util.sharedPrefs;
    Map<String, String> header = {
      //'Authorization': "Bearer " + prefs.getString(Constant.authToken)!,
      //'Content-Type': 'application/json',
    };
    final response = await NetworkUtility.makeWebServiceRequest(
        url: UrlConstant.cartCount, header: header, body: {});

    if (response.statusCode == 405) {
      //Session Timeout - User will be logged out from the app
      Util.logout(context);
    } else if (response.statusCode != 200 && response.statusCode != 405) {
      throw "Error While Retrieving Data API";
    }

    return response.body;
  }

  static Future<String> getcartListData(BuildContext context) async {
    Map<String, String> header = {
      // 'Authorization': "Bearer " + prefs.getString(Constant.authToken)!,
      //'Content-Type': 'application/json',
    };
    final response = await NetworkUtility.makeWebServiceRequest(
        url: UrlConstant.cartListUrl, header: header, body: {});

    if (response.statusCode == 405) {
      //Session Timeout - User will be logged out from the app
      Util.logout(context);
    } else if (response.statusCode != 200 && response.statusCode != 405) {
      throw "Error While Retrieving Data API";
    }

    return response.body;
  }
}
