import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:happy_bark/utils/constant.dart';
import 'package:happy_bark/utils/network_utils.dart';
import 'package:happy_bark/utils/url_constant.dart';
import 'package:happy_bark/utils/util.dart';

class OrderApiService {
  static Future<String> getorderDetailsData(
      BuildContext context, String id) async {
    final response = await NetworkUtility.makeWebServiceGetRequest(
      url: UrlConstant.orderDetailUrl + '/$id',
    );

    if (response.statusCode == 405) {
      //Session Timeout - User will be logged out from the app
      Util.logout(context);
    } else if (response.statusCode != 200 && response.statusCode != 405) {
      throw "Error While Retrieving Data API";
    }

    return response.body;
  }
}
